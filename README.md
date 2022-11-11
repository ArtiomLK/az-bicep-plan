# Azure App Service Plan

[![DEV - Deploy Azure Resource](https://github.com/ArtiomLK/azure-bicep-app-service-plan/actions/workflows/dev.orchestrator.yml/badge.svg?branch=main&event=push)](https://github.com/ArtiomLK/azure-bicep-app-service-plan/actions/workflows/dev.orchestrator.yml)

[Reference examples][1]

## App Service Plan Combinations

- App Service Plan **Free**:
  - `Free`
    - `F1`
- App Service Plan **Basic**:
  - `Basic`
    - `B1`
    - `B2`
    - `B3`
- App Service Plan **Standard**:
  - `Standard`
    - `S1`
    - `S2`
    - `S3`
- App Service Plan **PremiumV2** allows Hight Availability Zone Redundancy:
  - `PremiumV2`
    - `P1V2`
    - `P2V2`
    - `P3V2`
- App Service Plan **PremiumV3** allows Hight Availability Zone Redundancy:
  - `PremiumV3`
    - `P1V3`
    - `P2V3`
    - `P3V3`

## Subnet Requirements

| CIDR block size | Maximum available addresses | Maximum horizontal scale (instances)* |
| --------------- | --------------------------- | ------------------------------------- |
| /28             | 11                          | 5                                     |
| /27             | 27                          | 13                                    |
| /26             | 59                          | 29                                    |

[To avoid any issues with subnet capacity, use a /26 with 64 addresses][4]

## Locally test Azure Bicep Modules

```bash
# Create an Azure Resource Group
az group create \
--name 'rg-azure-bicep-app-service-plan' \
--location 'eastus2' \
--tags project=bicephub env=dev

# Deploy Sample Modules
az deployment group create \
--resource-group 'rg-azure-bicep-app-service-plan' \
--mode Complete \
--template-file examples/examples.bicep
```

## Additional Resources

- App Service Plan
- [MS | Docs |Integrate your app with an Azure virtual network][3]
- App Service
- [MS | Docs | App Service pricing - Comparison Table][2]

[1]: ./examples/examples.bicep
[2]: https://azure.microsoft.com/en-us/pricing/details/app-service/windows/
[3]: https://learn.microsoft.com/en-us/azure/app-service/overview-vnet-integration
[4]: https://learn.microsoft.com/en-us/azure/app-service/overview-vnet-integration#subnet-requirements
