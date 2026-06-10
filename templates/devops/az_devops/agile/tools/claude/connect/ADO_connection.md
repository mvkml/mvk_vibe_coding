# Azure DevOps — Connection Reference
**Purpose:** Share this file at the start of a session so Claude has full ADO context without re-asking.  
**Security:** PAT is NEVER stored here — user provides it each session when needed.

---

## Organisation & Project

| Field | Value |
|-------|-------|
| Organisation | `mvishnukiran05` |
| Organisation URL | `https://dev.azure.com/mvishnukiran05` |
| Project | `Master Control Program` |
| Project URL | `https://dev.azure.com/mvishnukiran05/Master%20Control%20Program` |

---

## Repositories

| Repo Name | Repo ID | Purpose |
|-----------|---------|---------|
| `MCPDevOps` | `a09661d3-99e4-4aff-b832-a79e352f6c36` | Main SA repo — terraform for storage account etc. |
| `MCPDevOps01` | `1172e77a-bf8a-428f-9ba5-7bae508da777` | Resource group terraform — local backend on VIDHYA |
| `MCPBootstrap` | `669e7823-fd7a-4766-bba8-1e1068d251b0` | Bootstrap infrastructure |
| `MCPreqest` | `77f09d70-02c8-4006-9e9e-a4a9a86dc6bd` | — |
| `Master Control Program` | `884059d6-3ec4-4bd3-8c83-459aa31f252c` | Root project repo |

---

## Pipelines (Build)

| Pipeline Name | Pipeline ID | Repo | YAML Path | Branch |
|---------------|-------------|------|-----------|--------|
| `001_RG_MCPDevOps01_Init` | `(MCPDevOps01)` | MCPDevOps01 | Classic YAML | main |
| `MCPDevOps_001_SA` | `20` | MCPDevOps | `AZ/McpSA/pipelines/001/001-mcpsa-plan.yml` | dev |
| `TempDiag-StateFileCheck` | `19` | — | — | — |
| `MCPBootstrap-CI` | — | MCPBootstrap | — | — |
| `MCPBootstrap-Init-V1` | — | MCPBootstrap | — | — |

---

## Release Pipelines (Classic)

| Pipeline Name | Purpose |
|---------------|---------|
| `001_RG_MCPDevOps01_Apply` | Applies terraform plan for MCPDevOps01 RG |
| `RP_MCPDevOps01_Destroy` | Destroys MCPDevOps01 resources (manual only) |

---

## Agent & Infrastructure

| Item | Value |
|------|-------|
| Agent Pool | `MCP_VISH` |
| Agent Machine | `VIDHYA` |
| Agent Version | `4.270.0` |
| Service Connection | `azure-sc-terraform` |
| Variable Group | `terraform-secret-vars` |

---

## Variable Group — `terraform-secret-vars`

Contains (never store values here — reference only):

| Variable | Purpose |
|----------|---------|
| `ARM_CLIENT_ID` | Service principal client ID |
| `ARM_CLIENT_SECRET` | Service principal secret |
| `ARM_TENANT_ID` | Azure tenant ID |
| `ARM_SUBSCRIPTION_ID` | Azure subscription ID |

---

## State Management

| Project | Backend | State Path |
|---------|---------|------------|
| MCPDevOps01 | `local` | `C:\terraform-state\mcpdevops01\terraform.tfstate` on VIDHYA |
| MCPDevOps (SA) | `local` | `C:\terraform-state\mcpdevops\terraform.tfstate` on VIDHYA |

---

## MCPDevOps_001_SA — Key Details

| Field | Value |
|-------|-------|
| Repo branch | `dev` |
| TF working dir | `AZ/McpSA/environments/dev/` |
| TF version | `1.7.5` |
| State key | `mcpdevops` |
| Trigger paths | `AZ/McpSA/environments/dev/**` |
| Resources managed | Resource group, storage account, storage container |

---

## How to Use This File

At the start of a session, tell Claude:

> "Read `C:\git\102_cicd\devops\documents\MCPDevOps01\notes\connect\ADO_connection.md` for ADO context"

Then provide your PAT when asked — Claude will use the API to access pipelines, logs, repos, and run history.

**PAT scope needed:** `Code (Read)`, `Build (Read)`, `Release (Read & Write)` — provided by user each session.
