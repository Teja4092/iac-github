param subscriptionID string = '001f528c-7b4f-45f0-b4c5-50381e79f4cc'

param tags object = {
  ApplicationOwner: 'Ravi Teja'
  Env2: 'Non-prod'
  Category: 'Bicep IAC GIT testing'
}

@description('Storage SKU')
param storageSkuName string = 'Standard_LRS'

@description('Storage Kind')
param stgkind string = 'StorageV2'

@description('Name of the storage account')
param storageName string = 'stbicepcac'

param location string = 'centralindia'

module resourcegroup '../../modules/rg/rg.bicep' = {
  scope: subscription(subscriptionID)
  name: 'rg-demo-cac'
  params: {
    location: location
    tags: tags
  }
}

module storgeaccount '../../modules/storage/st.bicep' = {
  name: storageName
  params: {
    storageSkuName: storageSkuName
    stgkind: stgkind
    location: location
  }
  scope: resourceGroup()
}
