<#
.SYNOPSIS
Delete a specified account.

.DESCRIPTION
I could not possibly be more specific than I could in the synopsis.

.PARAMETER Username
A string specifying the account to be deleted.

.EXAMPLE
Remove-Acc -Username "Rey"

.NOTES
Only light error handling here, meant for internal use, not direct contact with users.
#>

function Remove-Acc {
    param (
        $Username
    )
    
    #makes parameter required in a non annoying way
    if(-not($Username)) {Throw "Usage: Del-Acc -Username 'string'"}
    
    #delete the account
    Remove-LocalUser -Name $Username
}