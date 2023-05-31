targetScope = 'subscription'

param location string = 'centralindia'
param tags object = {
  ApplicationOwner: 'Ravi Teja'
  Env2: 'Non-prod'
  Category: 'Bicep IAC GIT testing'
}

// Resource group which is the scope for the main deployment below
resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'rg--demo'
  location: location
  tags: tags
}
