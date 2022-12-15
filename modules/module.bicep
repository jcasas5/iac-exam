param location string = resourceGroup().location
@allowed([
  'StorageV2'
  'BlobStorage'])
param storageAccountKind string
@allowed([
  'Hot'
  'Cool'
])
param storageAccountAccessTier string
param storageAccountSkuName string = 'Standard_LRS'

resource storageAccountResources 'Microsoft.Storage/storageAccounts@2021-09-01' = [for i in range(1,2): {
  name: 'jcasasus-final-exam${i}'
  location: location
  kind: storageAccountKind
  sku: {name: storageAccountSkuName}
  properties: {
    accessTier: storageAccountAccessTier
  }
}]
