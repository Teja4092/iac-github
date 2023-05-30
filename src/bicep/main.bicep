param storageName string = 'stbicepcac'
param location string = 'centralindia'
param skuname string = 'Standard_LRS'
param stgkind string = 'StorageV2'

resource storageaccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageName
  location: location
  sku: {
    name: skuname
  }
  kind: stgkind
  properties: {
    minimumTlsVersion: 'TLS1_2'
    allowBlobPublicAccess: true
  }
}
