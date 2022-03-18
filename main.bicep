// ------------------------------------------------------------------------------------------------
// Deployment parameters
// ------------------------------------------------------------------------------------------------
@description('Az Resources tags')
param tags object = {}
@description('Az Resources deployment location')
param location string

// ------------------------------------------------------------------------------------------------
// Application parameters
// ------------------------------------------------------------------------------------------------
@description('App Service Plan Size')
@allowed([
  'F1'
  'B1'
  'B2'
  'B3'
  'S1'
  'S2'
  'S3'
  'P1V2'
  'P2V2'
  'P3V2'
  'P1V3'
  'P2V3'
  'P3V3'
])
param plan_sku_code string = 'F1'

@description('App Service Plan SKU Tier')
@allowed([
  'Free'
  'Basic'
  'Standard'
  'PremiumV2'
  'PremiumV3'
])
param plan_sku_tier string = 'Free'

@description('App Service Plan Name')
param plan_n string

@description('App Service Plan OS kind')
@allowed([
  'windows'
  'linux'
])
param plan_os_kind string = 'windows'

@description('Enable App Service Plan High Availability Zone Redundancy')
param plan_enable_zone_redundancy bool = false // CAN'T BE UPDATED AFTER RESOURCE DEPLOYMENT

// ------------------------------------------------------------------------------------------------
// Deploy Azure Resources
// ------------------------------------------------------------------------------------------------
resource appServicePlan 'Microsoft.Web/serverfarms@2021-03-01' = {
  tags: tags
  name: plan_n
  location: location
  kind: plan_os_kind == 'linux' ? 'linux' : ''
  sku: {
    name: plan_sku_code
    tier: plan_sku_tier
    capacity: plan_enable_zone_redundancy ? 3 : 1
  }
  properties: {
    zoneRedundant: plan_enable_zone_redundancy
    reserved: plan_os_kind == 'linux'
  }
}

output result object = appServicePlan
output id string = appServicePlan.id
