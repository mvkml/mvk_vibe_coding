# Project Reference — IDs and Endpoints
# Project  : MCPDevOps / Master Control Program
# Version  : 20260603_182000_project_ids_reference
# Author   : Dev DevOps Agent
# Date     : 2026-06-03
# Purpose  : Central reference for all non-sensitive project IDs
#            PAT and CLIENT_SECRET are intentionally excluded — never stored in files

---

## Azure DevOps

| Item | Value |
|------|-------|
| Organization | `mvishnukiran05` |
| Organization URL | `https://dev.azure.com/mvishnukiran05` |
| Project Name | `Master Control Program` |
| Project ID | `5e20d373-0ff5-4c5b-8d91-6ae97e61aa14` |
| PAT | `PASTE-AT-RUNTIME — never stored in files` |

---

## Repositories

| Repository | ID | Purpose |
|-----------|-----|---------|
| `MCPBootstrap` | `669e7823-fd7a-4766-bba8-1e1068d251b0` | Creates Terraform state storage |
| `MCPDevOps` | `a09661d3-99e4-4aff-b832-a79e352f6c36` | Main CI/CD pipeline — creates rg-mcp-dev |

---

## Azure Service Principal (ARM)

| Item | Value |
|------|-------|
| ARM_CLIENT_ID | `5e06c8aa-def6-447e-a3dd-3505aea30251` |
| ARM_CLIENT_SECRET | `PASTE-AT-RUNTIME — never stored in files` |
| ARM_TENANT_ID | `d4bedd23-f252-4975-8312-b195d1954be3` |
| ARM_SUBSCRIPTION_ID | `ce658dab-cae6-43c7-aa43-3f8c2ea7f68f` |

---

## Azure Resources

| Resource | Name | Location | Status |
|---------|------|---------|--------|
| State Resource Group | `rg-terraform-state` | Central India | Pending — Step 5 |
| State Storage Account | `samcpterraformstate` | Central India | Pending — Step 5 |
| State Blob Container | `tfstate` | — | Pending — Step 5 |
| Project Resource Group | `rg-mcp-dev` | Central India | Pending — Step 12 |

---

## Commit History (MCPDevOps Repo)

| Step | Push ID | Commit ID | Description |
|------|---------|-----------|-------------|
| Step 2 | 16 | `61f14206cb412c49ca20d664bc7e7da060da82e2` | Folder structure (terraform/ + pipelines/) |
| Step 3 | 17 | `8ec96a150d93aae6e0999394f830e002bf4a4534` | Terraform files pushed |
| Step 4 | 18 | `0715152aa487149738fa5da3cea810c7ca700ac5` | azure-pipelines.yml pushed |

---

## Variable Group

| Item | Value |
|------|-------|
| Variable Group Name | `terraform-secret-vars` |
| Variable Group ID | `1` |
| Variables | ARM_CLIENT_ID, ARM_CLIENT_SECRET, ARM_TENANT_ID, ARM_SUBSCRIPTION_ID |
| Status | CREATED — Step 6 (2026-06-04) |

---

## Service Connection

| Item | Value |
|------|-------|
| Name | `azure-sc-terraform` |
| ID   | `4ed845d8-fd5c-4b3f-b606-2a0a70e6e8f6` |
| Type | Azure Resource Manager (Service Principal — Manual) |
| Subscription | `Azure subscription 1` |
| Scope | Subscription |
| Status | CREATED — Step 7 (2026-06-04) |

---

## How to Use This File at Runtime

When starting a new session, read this file to get all non-sensitive IDs.
Then ask the user for the two runtime secrets:

```
1. PAT          → Use for Azure DevOps REST API calls (Authorization header only)
2. CLIENT_SECRET → Use for az login or -var="client_secret=..." (memory only)
```

Neither value is ever written to a file. Both are used only during active execution.

---

## Revision History

| Version | Date | Change |
|---------|------|--------|
| 20260603_182000_project_ids_reference | 2026-06-03 | Initial creation |
| 20260604_001736_variable_group_added  | 2026-06-04 | Variable Group ID 1 recorded after Step 6 completion |
| 20260604_004147_service_connection_added | 2026-06-04 | Service Connection ID recorded after Step 7 completion |
