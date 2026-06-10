# Terraform `-out` Flag — Notes

**Date:** 2026-06-09

---

## What is `-out=tfplan`?

It is a **Terraform CLI flag** — nothing to do with `.tf` files.
It saves the plan to a binary file so the apply step uses the exact same plan.

```bash
terraform plan  -out=$(TF_WORKING_DIR)/tfplan   # saves binary plan file
terraform apply $(TF_WORKING_DIR)/tfplan         # applies exactly what was planned
```

---

## Is it a default?

**No.** You must explicitly specify `-out=<path>`. If omitted, the plan is printed to the console and discarded — nothing is saved.

---

## Do you need anything in `.tf` files for this?

**No.** Nothing in your `.tf` files is needed. `-out` is purely a CLI/pipeline concern.

---

## Why use it in CI/CD?

| Without `-out` | With `-out` |
|---|---|
| `apply` re-runs the plan at apply time | `apply` uses the saved plan — no re-evaluation |
| Risk of drift between plan and apply | Guaranteed: apply = exactly what was planned |
| Not safe for automated pipelines | Safe and recommended for CI/CD |

---

## Common Confusion: `-out` vs Terraform `output` blocks

These are **completely different things:**

| | `-out=tfplan` (CLI flag) | `output` block in `.tf` |
|---|---|---|
| What it is | CLI flag | HCL block in `.tf` file |
| What it does | Saves the plan to a binary file | Exposes resource attribute values |
| Where it lives | Pipeline / command line only | `outputs.tf` |
| Needs `.tf` changes? | No | Yes — must declare `output` block |
| Required? | Optional but recommended in CI/CD | Optional, only when exposing values |

### Example `output` block (unrelated to `-out`):

```hcl
# outputs.tf
output "storage_account_name" {
  value = azurerm_storage_account.this.name
}
```

---

## Pipeline Flow with `-out`

```
terraform plan -out=$(TF_WORKING_DIR)/tfplan
        ↓
  (optional: approval gate / plan review)
        ↓
terraform apply $(TF_WORKING_DIR)/tfplan
```

### Full pipeline tasks example:

```yaml
# Plan
- task: TerraformTaskV4@4
  displayName: 'Terraform Plan'
  inputs:
    command: 'plan'
    commandOptions: '-out=$(TF_WORKING_DIR)/tfplan'

# Apply
- task: TerraformTaskV4@4
  displayName: 'Terraform Apply'
  inputs:
    command: 'apply'
    commandOptions: '$(TF_WORKING_DIR)/tfplan'
```

---

## Key Takeaways

- `-out` saves the plan binary — no `.tf` changes needed
- Always use `-out` in CI/CD pipelines to avoid drift between plan and apply
- `tfplan` is a binary file — not human-readable, but used by `terraform apply`
- Terraform `output` blocks in `.tf` files are a separate concept — they expose resource values after apply
