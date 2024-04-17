// Creates a storage account, private endpoints and DNS
@description('Azure region of the deployment')
param location string = 'centralindia'


@description('Name of the storage account')
param storageName string = 'stbicepcac'

@allowed([
  'Standard_LRS'
  'Standard_ZRS'
  'Standard_GRS'
  'Standard_GZRS'
  'Standard_RAGRS'
  'Standard_RAGZRS'
  'Premium_LRS'
  'Premium_ZRS'
])

@description('Storage SKU')
param storageSkuName string

@description('Storage Kind')
param stgkind string = 'StorageV2'

param tags object = {
  ApplicationOwner: 'Ravi Teja'
  Env2: 'Non-prod'
  Category: 'Bicep IAC GIT testing'
}

resource storageaccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageName
  location: location
  tags: tags
  sku: {
    name: storageSkuName
  }
  kind: stgkind
  properties: {
    minimumTlsVersion: 'TLS1_2'
    allowBlobPublicAccess: true
  }
}
