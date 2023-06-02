targetScope = 'subscription'
param project string
param environmentType string
param resourcegroupname string
param tags object = {
  ApplicationOwner: 'Ravi Teja'
}
// param location string = 'centralindia'
param location string = deployment().location
resource newRG 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourcegroupname
  location: location
  tags: tags
}

output project string = project
output environmentType string = environmentType
