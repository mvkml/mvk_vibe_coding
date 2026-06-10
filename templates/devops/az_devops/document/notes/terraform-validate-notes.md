# Terraform Validate — Notes

**Date:** 2026-06-09

---

## Pipeline Task

```yaml
- task: TerraformTaskV4@4
  displayName: 'Terraform Validate'
  inputs:
    provider: 'azurerm'
    command: 'validate'
    workingDirectory: '$(TF_WORKING_DIR)'
    environmentServiceNameAzureRM: 'azure-sc-terraform'
```

---

## What it does

Checks `.tf` files for syntax and configuration errors — without connecting to Azure or making any API calls.

---

## What it validates

| Checks | Example errors it catches |
|---|---|
| HCL syntax | Missing `}`, wrong block structure |
| Required arguments | `resource` block missing a required field |
| Variable references | `var.something` that is never declared |
| Provider schema | Wrong attribute name on a resource |
| Module inputs | Missing required module variables |

---

## What it does NOT check

- Whether resources actually exist in Azure
- Whether credentials are valid
- Whether the plan will succeed
- Real infrastructure state

---

## Do you need anything in `.tf` files for this?

**No special additions needed.** It validates whatever `.tf` files exist in `workingDirectory`.
But for it to pass you need at minimum:

- A valid `terraform {}` block in `provider.tf`
- All `variable` blocks declared for anything referenced as `var.x`
- All `resource` / `module` blocks using correct attribute names

---

## Pipeline Position — Why after `init`?

`validate` must come **after `terraform init`** because it needs provider schemas downloaded to check attribute names.

```
Step 1: Install Terraform CLI
Step 2: terraform init        ← downloads providers/modules
Step 3: terraform validate    ← checks .tf files are valid
Step 4: terraform plan        ← shows what will change
Step 5: terraform apply       ← makes the changes
```

---

## Key Difference from `plan`

| | `terraform validate` | `terraform plan` |
|---|---|---|
| Connects to Azure? | No | Yes |
| Checks syntax | Yes | Yes |
| Checks real infra state | No | Yes |
| Speed | Very fast | Slower |
| Needs credentials? | No | Yes |

---

## Key Takeaways

- `validate` is a fast, offline check — no Azure connection needed
- Always run it after `init` and before `plan` in CI/CD pipelines
- Catches errors early before wasting time on a full `plan`
- Does not replace `plan` — both are needed in a pipeline
