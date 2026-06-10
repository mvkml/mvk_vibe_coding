# Architecture Diagrams — MCPDevOps
**Version:** 20260603_100000_architecture_diagrams

**Owner:** Architect Agent
**Updated:** 2026-06-03

---

## CI/CD Flow Diagram

```
Developer (local)
      |
      | git push origin main  (terraform/** files changed)
      v
+---------------------------+
|  Azure DevOps Repo        |
|  MCPDevOps / main branch  |
+---------------------------+
      |
      | trigger (on push to main, path: terraform/**)
      v
+----------------------------------------------+
|  CI Build Pipeline  (ubuntu-latest)           |
|  Stage: TerraformPlan                         |
|  ┌─────────────────────────────────────────┐  |
|  │ 1. Install Terraform 1.7.5              │  |
|  │ 2. terraform init  (remote backend)     │  |
|  │    └─ samcpterraformstate / tfstate     │  |
|  │ 3. terraform validate                   │  |
|  │ 4. terraform plan -out=tfplan           │  |
|  │    └─ vars injected from Variable Group │  |
|  │ 5. Publish artifact: terraform-plan     │  |
|  └─────────────────────────────────────────┘  |
+----------------------------------------------+
      |
      | artifact: terraform-plan (contains tfplan + tf files)
      v
+----------------------------------------------+
|  [MANUAL APPROVAL GATE]                       |
|  Pre-deployment condition on Dev stage        |
|  Approver: team member / user                 |
+----------------------------------------------+
      |
      | approved
      v
+----------------------------------------------+
|  CD Release Pipeline                          |
|  Stage: Dev                                   |
|  ┌─────────────────────────────────────────┐  |
|  │ 1. Download artifact: terraform-plan    │  |
|  │ 2. terraform init  (remote backend)     │  |
|  │ 3. terraform apply -auto-approve tfplan │  |
|  └─────────────────────────────────────────┘  |
+----------------------------------------------+
      |
      v
+-------------------------------+
|  Azure Cloud (Central India)  |
|  Resource Group: rg-mcp-dev   |
|  Tags:                        |
|    Environment = Dev          |
|    Project = MasterControl    |
|    ManagedBy = Terraform      |
|    CreatedBy = AzureDevOps    |
+-------------------------------+
```

---

## Remote State Architecture

```
Terraform CLI
    |
    | backend "azurerm"
    v
Azure Storage Account: samcpterraformstate
    └── Container: tfstate
            └── Blob: terraform.tfstate  (state file)
```

---

## Authentication Flow

```
Azure DevOps Pipeline
    |
    | Variable Group: terraform-secret-vars
    | (ARM_CLIENT_ID, ARM_CLIENT_SECRET, ARM_TENANT_ID, ARM_SUBSCRIPTION_ID)
    v
Terraform azurerm provider
    |
    | Service Principal login
    v
Azure Resource Manager API
    |
    v
Create / Manage Azure Resources
```
