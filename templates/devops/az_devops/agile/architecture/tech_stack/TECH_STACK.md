# Tech Stack — MCPDevOps
**Version:** 20260603_100000_tech_stack

**Project:** MCPDevOps — Azure DevOps CI/CD with Terraform
**Owner:** Architect Agent
**Updated:** 2026-06-03

---

## Stack

| Layer | Technology | Version / Detail |
|-------|-----------|-----------------|
| IaC | Terraform | 1.7.5 |
| Cloud Provider | Azure (azurerm) | ~> 3.0 |
| CI/CD Platform | Azure DevOps | Classic Release + YAML Build |
| Automation | PowerShell | 5.1+ / Azure DevOps REST API |
| Remote State | Azure Blob Storage | samcpterraformstate / tfstate container |
| Auth | Service Principal | Client ID + Secret (ARM variables) |
| Secrets Store | Azure DevOps Variable Groups | terraform-secret-vars |
| Agent Pool | Microsoft-hosted | ubuntu-latest |

---

## Azure Resources Managed by Terraform
| Resource | Name | Location |
|---------|------|----------|
| Resource Group | rg-mcp-dev | Central India |
| (State) Resource Group | rg-terraform-state | Central India |
| (State) Storage Account | samcpterraformstate | Central India |
| (State) Blob Container | tfstate | — |

---

## Azure DevOps Components
| Component | Name |
|----------|------|
| Organisation | mvishnukiran05 |
| Project | Master Control Program |
| Repository | MCPDevOps |
| Service Connection | azure-sc-terraform |
| Variable Group | terraform-secret-vars |
| Build Pipeline | azure-pipelines.yml (main branch, terraform/** trigger) |
| Release Pipeline | Classic Release — Dev stage with Manual Approval |

---

## NOT In Scope
- No frontend application
- No backend application
- No database / SQL
- No Docker / containers (this sprint)
