echo " === Start azure_deployment.ps1 ==="

# Import Azure-PowerShell Module
echo " === Import Azure-PowerShell Module ==="
Import-Module -Name Az

# Connect to Azure Account
echo " === Connect to Azure Account ==="
Connect-AzAccount

$current_dir_path = (Get-Item .).FullName

# Define Deployment Parameters
$virtualMachineNumber = Read-Host -Prompt "Enter the Virtual Machine Number (between 1 to 254)"
$virtualMachinePassword = Read-Host -Prompt "Enter the Virtual Machine Login Password" -AsSecureString
$location = Read-Host -Prompt "Enter the location (i.e. centralus)"

$resourceGroupName = "cloudAI-$virtualMachineNumber-rg"

# Create Resoure Group
echo " === Create Resource Group ==="
New-AzResourceGroup -Name $resourceGroupName -Location "$location"

# Deploy
echo " === Deploy ==="
New-AzResourceGroupDeployment `
    -ResourceGroupName $resourceGroupName `
    -TemplateFile "./templates/cloudAI_template.json" `
    -location $location `
    -virtualMachineNumber $virtualMachineNumber `
    -virtualMachinePassword $virtualMachinePassword

# Echo the Resource Group Name
(Get-AzVm -ResourceGroupName $resourceGroupName).name