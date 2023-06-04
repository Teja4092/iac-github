targetScope = 'subscription'
@description('The location into which your Azure resources should be deployed.')
param location string = 'centralindia'
@description('Select the type of environment you want to provision. Allowed values are development, Production and Test.')
@allowed([
  'pd'
  'te'
  'de'
])
param environment string
param project string
param subscriptionID string = '001f528c-7b4f-45f0-b4c5-50381e79f4cc'
param resourcegroupname string = 'rg-${project}-${environment}-cin'
@description('Name of the storage account')
param storageName string = 'st${project}${environment}cin'

output resourcegroupname string = resourcegroupname
output storagename string = storageName

// Define the names for resources.


resource resourceGroup 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: resourcegroupname
  location: location
}


module newRG '../../modules/rg/rg.bicep' = {
  scope: subscription(subscriptionID)
  name: resourcegroupname
  params: {
    resourcegroupname: resourcegroupname
    location: location
    environmentType: environment
    project : project
  }
}

module storageaccount '../../modules/storage/st.bicep' = {
  scope: resourceGroup
  name: storageName
  params: {
    location: location
    storageName: storageName
    tags: {
    }
  }
}
