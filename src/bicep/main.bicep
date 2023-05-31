param applicationName string = 'demo'
param environment string = 'de'

@description('Storage SKU')
param storageSkuName string = 'Standard_LRS'

@description('Storage Kind')
param stgkind string = 'StorageV2'

@description('Name of the storage account')
param storageName string = 'stbicepcac'

param location string = 'centralindia'

module resourcegroup '../../modules/rg/rg.bicep' = {
  scope: subscription()
  name: 'rg-${applicationName}-${environment}'
  params: {
    applicationName: applicationName
    environment: environment
    location: location
  }
}


module storgeaccount '../../modules/storage/st.bicep' = {
  name:storageName
  params: {
    storageSkuName :storageSkuName
    stgkind : stgkind
    location :location
  }
}


// resource storageaccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
//   name: storageName
//   location: location
//   sku: {
//     name: skuname
//   }
//   kind: stgkind
//   properties: {
//     minimumTlsVersion: 'TLS1_2'
//     allowBlobPublicAccess: true
//   }
// }
