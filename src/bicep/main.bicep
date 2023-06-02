targetScope = 'subscription'
@description('The location into which your Azure resources should be deployed.')
param location string
@description('Select the type of environment you want to provision. Allowed values are development, Production and Test.')
@allowed([
  'pd'
  'te'
  'de'
])
param environmentType string
param project string
param subscriptionID string = '001f528c-7b4f-45f0-b4c5-50381e79f4cc'
param resourcegroupname string


// Define the names for resources.

module newRG '../../modules/rg/rg.bicep' = {
  scope: subscription(subscriptionID)
  name: resourcegroupname
  params: {
    resourcegroupname: resourcegroupname
    location: location
  }
}
