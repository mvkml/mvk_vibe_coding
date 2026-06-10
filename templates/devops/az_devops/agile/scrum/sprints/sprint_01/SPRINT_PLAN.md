# Sprint 01 Plan — MCPDevOps
**Version:** 20260603_100000_sprint_01_plan

**Sprint Goal:** Set up prerequisites and create the MCPDevOps repository in Azure DevOps with Terraform files pushed in the correct folder structure.

**Start Date:** 2026-06-03
**Owner:** Dev DevOps Agent
**Facilitator:** Scrum Master Agent

---

## User Stories in Sprint

| ID | Story | Assigned To | Status |
|----|-------|-------------|--------|
| US-01 | Create Azure Storage Account for Terraform remote state | Dev DevOps | To Do |
| US-02 | Create Service Connection in Azure DevOps (azure-sc-terraform) | Dev DevOps | To Do |
| US-03 | Create Variable Group (terraform-secret-vars) with 4 ARM secrets | Dev DevOps | To Do |
| US-04 | Create MCPDevOps repository in Azure DevOps via PowerShell | Dev DevOps | To Do |
| US-05 | Push Terraform files with correct folder structure | Dev DevOps | To Do |

---

## Tasks Breakdown

### US-01: Storage Account
- [ ] Run PowerShell: `az group create` for rg-terraform-state
- [ ] Run PowerShell: `az storage account create` samcpterraformstate
- [ ] Run PowerShell: `az storage container create` tfstate

### US-02: Service Connection
- [ ] Create Service Connection via Azure DevOps UI or REST API
- [ ] Name: azure-sc-terraform
- [ ] Verify connection succeeds

### US-03: Variable Group
- [ ] Create Variable Group via PowerShell / REST API
- [ ] Add ARM_CLIENT_ID, ARM_CLIENT_SECRET, ARM_TENANT_ID, ARM_SUBSCRIPTION_ID
- [ ] Mark all as Secret

### US-04: Repository
- [ ] Call Azure DevOps REST API via PowerShell to create MCPDevOps repo
- [ ] Verify repo appears in Azure DevOps

### US-05: Push Terraform Files
- [ ] Clone the new repo locally
- [ ] Create folder structure: terraform/ + pipelines/
- [ ] Copy all Terraform files into terraform/
- [ ] Copy azure-pipelines.yml into pipelines/
- [ ] git add → commit → push to main

---

## Blockers
| Blocker | Needed From |
|---------|------------|
| Azure DevOps PAT | User |
| ARM_CLIENT_SECRET | User |

---

## Sprint Acceptance Criteria (QA Sign-off)
- [ ] `rg-terraform-state` resource group exists in Azure
- [ ] `samcpterraformstate` storage account exists with `tfstate` container
- [ ] `azure-sc-terraform` service connection is verified in Azure DevOps
- [ ] `terraform-secret-vars` variable group exists with 4 secret variables
- [ ] `MCPDevOps` repo exists in Azure DevOps
- [ ] Repo contains `terraform/` and `pipelines/` folders on `main` branch
