targetScope = 'resourceGroup'
// ------------------------------------------------------------------------------------------------
// Deployment parameters
// ------------------------------------------------------------------------------------------------
// Sample tags parameters
var tags = {
  project: 'bicephub'
  env: 'dev'
}

// ------------------------------------------------------------------------------------------------
// REPLACE
// '../main.bicep' by the ref with your version, for example:
// 'br:bicephubdev.azurecr.io/bicep/modules/plan:v1'
// ------------------------------------------------------------------------------------------------

// ------------------------------------------------------------------------------------------------
// Windows App Service Plan examples
// ------------------------------------------------------------------------------------------------
module DefaultPlan '../main.bicep' = {
  name: 'DefaultPlan'
  params: {
    plan_n: 'plan-DefaultPlan'
    location: 'eastus2'
  }
}

module DeployOnePlanPremiumv3 '../main.bicep' = {
  name: 'DeployOnePlanPremiumv3'
  params: {
    plan_enable_zone_redundancy: false
    plan_sku_code: 'P1V3'
    plan_sku_tier: 'PremiumV3'
    plan_n: 'plan-DeployOnePlanPremiumv3'
    location: 'eastus2'
    tags: tags
  }
}

module DeployOnePlanPremiumv2HA '../main.bicep' = {
  name: 'DeployOnePlanPremiumv2HA'
  params: {
    plan_enable_zone_redundancy: true
    plan_sku_code: 'P1V2'
    plan_sku_tier: 'PremiumV2'
    plan_n: 'plan-DeployOnePlanPremiumv2HA'
    location: 'eastus'
    tags: tags
  }
}

module DeployOnePlanStandard '../main.bicep' = {
  name: 'DeployOnePlanStandard'
  params: {
    plan_enable_zone_redundancy: false
    plan_sku_code: 'S2'
    plan_sku_tier: 'Standard'
    plan_n: 'plan-DeployOnePlanStandard'
    location: 'centralus'
    tags: tags
  }
}

module DeployOnePlanBasic '../main.bicep' = {
  name: 'DeployOnePlanBasic'
  params: {
    plan_enable_zone_redundancy: false
    plan_sku_code: 'B1'
    plan_sku_tier: 'Basic'
    plan_n: 'plan-DeployOnePlanBasic'
    location: 'westus'
    tags: tags
  }
}

module DeployOnePlanFree '../main.bicep' = {
  name: 'DeployOnePlanFree'
  params: {
    plan_enable_zone_redundancy: false
    plan_sku_code: 'F1'
    plan_sku_tier: 'Free'
    plan_n: 'plan-DeployOnePlanFree'
    location: 'southcentralus'
    tags: tags
  }
}

module DeployOneLinuxPlanPremiumv2 '../main.bicep' = {
  name: 'DeployOneLinuxPlanPremiumv2'
  params: {
    plan_enable_zone_redundancy: false
    plan_sku_code: 'P2V2'
    plan_sku_tier: 'PremiumV2'
    plan_n: 'plan-DeployOneLinuxPlanPremiumv2'
    plan_os_kind: 'linux'
    location: 'eastus'
    tags: tags
  }
}

// ------------------------------------------------------------------------------------------------
// Linux App Service Plan examples
// ------------------------------------------------------------------------------------------------
module DeployOneLinuxPlanStandard '../main.bicep' = {
  name: 'DeployOneLinuxPlanStandard'
  params: {
    plan_enable_zone_redundancy: false
    plan_sku_code: 'S2'
    plan_sku_tier: 'Standard'
    plan_n: 'plan-DeployOneLinuxPlanStandard'
    plan_os_kind: 'linux'
    location: 'centralus'
    tags: tags
  }
}

module DeployOneLinuxPlanFree '../main.bicep' = {
  name: 'DeployOneLinuxPlanFree'
  params: {
    plan_enable_zone_redundancy: false
    plan_sku_code: 'F1'
    plan_sku_tier: 'Free'
    plan_os_kind: 'linux'
    plan_n: 'plan-DeployOneLinuxPlanFree'
    location: 'eastus'
    tags: tags
  }
}
