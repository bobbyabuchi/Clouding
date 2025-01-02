# Power Shell Azure CLI Counterpart

Connect-AzAccount # connect to Azure account

# Uploading Blobs --------------------------------------------------------------------

# first create a storage account

Get-Command *StorageAccount* # will list all the avalable PowerShell 'StorageAccount'commandlets

Get-AzStorageAccount # list all available storage accounts in your Subscription

# store a ref to the storage account in a variable 
$RG = 'rg_sb_centralindia_192200_3_173582079989'

# retrieve and store the context of hcsdev25 storage account in variable '$ctx'
$ctx=Get-AzStorageAccount -R $RG -name hcsdev25

# pipes the $ctx object to Get-Member to list all its properties available on the storage account context object
$ctx | Get-Member -Type Property

# updates the $ctx variable to hold the storage account's Context, for subsequent storage operations and in this case, the storage account endpoints
$ctx=$ctx.Context

# create a blob container
New-AzStorageContainer -Name "clients" -Context $ctx

# upload a file
Set-AzStorageBlobContent -File "files/clients_data.txt" -Container clients -Blob clients_data.txt -Context $ctx

# verify upload
Get-AzStorageContainer -Name clients -Context $ctx | Get-AzStorageBlob | Select-Object Name


# Another Task --------------------------------------------------------------------------------