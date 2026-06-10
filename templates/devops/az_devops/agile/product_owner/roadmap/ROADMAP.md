# Product Roadmap — MCPDevOps
**Version:** 20260603_100000_product_roadmap

**Project:** MCPDevOps — Azure DevOps CI/CD with Terraform
**Updated:** 2026-06-03

---

## Delivery Plan

```
Sprint 01 (Now)
├── US-01: Create Azure Storage Account for remote state
├── US-02: Create Service Connection (azure-sc-terraform)
├── US-03: Create Variable Group (terraform-secret-vars)
├── US-04: Create MCPDevOps repo in Azure DevOps (PowerShell)
└── US-05: Push Terraform files with correct folder structure

Sprint 02
├── US-06: Create CI Build Pipeline from azure-pipelines.yml
└── US-07: Verify CI runs green (init → validate → plan → artifact)

Sprint 03
├── US-08: Create CD Release Pipeline with Manual Approval Gate
├── US-09: Configure Terraform Apply task
└── US-10: End-to-end validation → rg-mcp-dev created in Azure
```

---

## Definition of Done
The project is DONE when:
- [ ] A git push to `main` (terraform/**) triggers the CI pipeline automatically
- [ ] CI publishes a `terraform-plan` artifact
- [ ] Release pipeline waits for manual approval
- [ ] After approval, `terraform apply` runs and creates `rg-mcp-dev` in Azure (Central India)
- [ ] `az group show --name rg-mcp-dev` returns the resource group

---

## Key Dependencies
| Dependency | Owner | Status |
|-----------|-------|--------|
| Azure DevOps PAT | User | Pending |
| ARM_CLIENT_SECRET | User | Pending |
| Azure Subscription active | User | Assumed OK |
