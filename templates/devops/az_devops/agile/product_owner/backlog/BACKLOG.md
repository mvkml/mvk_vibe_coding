# Product Backlog — MCPDevOps
**Version:** 20260603_100000_product_backlog

**Project:** MCPDevOps — Azure DevOps CI/CD with Terraform
**Owner:** Product Owner Agent
**Last Updated:** 2026-06-03

---

## Goal
Deliver a fully automated CI/CD pipeline that provisions an Azure Resource Group
(`rg-mcp-dev`, Central India) using Terraform, triggered by a git push to Azure DevOps,
with a Manual Approval Gate before apply.

---

## Epics

| # | Epic | Sprint | Status |
|---|------|--------|--------|
| E1 | Infrastructure Prerequisites | Sprint 01 | To Do |
| E2 | Azure DevOps Repository Setup | Sprint 01 | To Do |
| E3 | CI Build Pipeline (Terraform Plan) | Sprint 02 | To Do |
| E4 | CD Release Pipeline (Terraform Apply) | Sprint 03 | To Do |
| E5 | End-to-End Validation | Sprint 03 | To Do |

---

## Backlog Items

### E1 — Infrastructure Prerequisites
| ID | Story | Priority |
|----|-------|----------|
| US-01 | As DevOps, create Azure Storage Account for Terraform remote state | High |
| US-02 | As DevOps, create Service Connection in Azure DevOps (azure-sc-terraform) | High |
| US-03 | As DevOps, create Variable Group with 4 ARM secret variables | High |

### E2 — Repository Setup
| ID | Story | Priority |
|----|-------|----------|
| US-04 | As DevOps, create MCPDevOps repository in Azure DevOps via PowerShell | High |
| US-05 | As DevOps, push Terraform files with correct folder structure (terraform/ + pipelines/) | High |

### E3 — CI Build Pipeline
| ID | Story | Priority |
|----|-------|----------|
| US-06 | As DevOps, create the Build Pipeline from azure-pipelines.yml | High |
| US-07 | As DevOps, verify CI runs: init → validate → plan → artifact published | High |

### E4 — CD Release Pipeline
| ID | Story | Priority |
|----|-------|----------|
| US-08 | As DevOps, create Release Pipeline with Manual Approval Gate on Dev stage | High |
| US-09 | As DevOps, configure Terraform Apply task in Release Pipeline | High |

### E5 — End-to-End Validation
| ID | Story | Priority |
|----|-------|----------|
| US-10 | As QA, trigger full pipeline: git push → CI → approve → CD → verify rg-mcp-dev exists | High |
