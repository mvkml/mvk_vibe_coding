# Naming Convention — MCPDevOps
**Version:** 20260603_100000_naming_convention

**Owner:** Architect Agent
**Updated:** 2026-06-03

---

## Azure Resources
| Resource Type | Convention | Example |
|--------------|-----------|---------|
| Resource Group | `rg-<project>-<env>` | `rg-mcp-dev` |
| Storage Account | `sa<project><purpose>` (lowercase, no hyphens) | `samcpterraformstate` |
| Blob Container | lowercase, short | `tfstate` |
| Service Connection | `<provider>-sc-<purpose>` | `azure-sc-terraform` |
| Variable Group | `<tool>-<type>-vars` | `terraform-secret-vars` |

## Terraform Files
| File | Purpose |
|------|---------|
| `main.tf` | Provider + resources |
| `variables.tf` | All variable declarations |
| `outputs.tf` | Output values |
| `terraform.tfvars` | Non-sensitive defaults only |

## Azure DevOps Files
| File | Location |
|------|---------|
| Build Pipeline YAML | `pipelines/azure-pipelines.yml` |
| Release Reference | `pipelines/release-pipeline-reference.yml` |

## Agile Worklog Files
```
agile/worklogs/<agent_name>/YYYYMMDD_HHMMSS_subject.md
Example: 20260603_143000_sprint01_repo_setup.md
```

## Branches
| Branch | Purpose |
|--------|---------|
| `main` | Production — triggers CI pipeline |

## Secrets (never in git)
- ARM_CLIENT_SECRET → Azure DevOps Variable Group only
- No `.env` files committed
