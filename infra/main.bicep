@minLength(3)
param appServicePlanName string = 'asp-github-actions-01-westeurope'

@minLength(3)
param webAppName string = 'app-github-actions-01-westeurope'

param location string = resourceGroup().location

resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: appServicePlanName
  location: location
  sku: {
    name: 'F1'
    tier: 'Free'
  }
}

resource webApp 'Microsoft.Web/sites@2022-03-01' = {
  name: webAppName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
  }
}



output appServicePlanId string = appServicePlan.id
output webAppUrl string = 'https://${webApp.properties.defaultHostName}'
