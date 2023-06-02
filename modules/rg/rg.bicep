targetScope = 'subscription'
param project string
param environmentType string
param location string = deployment().location
resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'rg-${project}-${environmentType}-cac'
  location: location
}
