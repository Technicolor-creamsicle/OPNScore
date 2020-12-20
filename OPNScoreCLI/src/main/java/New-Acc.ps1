<#
.SYNOPSIS
Create user accounts.

.DESCRIPTION
See short description, with the added caveat that you can specify the privleges of the user you create.

.PARAMETER Username
It's a username for an account I don't know what else to tell you.

.PARAMETER Is_Admin
Boolean. set to false by default. pass in $true for admin privleges.

.EXAMPLE
Normal user
    New-Acc -Username "Anakin"
    New-Acc -Username "not_a_master" -Is_Admin $false
Admin user
    New-Acc -Username "Darthy" -Is_Admin $true

.NOTES
Only light error handling, not really meant to be handled by an end user. Oh and passwords are all the same rn.
#>

function New-Acc {
    param (
        $Username,
        $Is_Admin = $false
    )
    
    #makes parameter required in a non annoying way
    if(-not($Username)) {Throw "Usage: New-Acc -Username 'string' -Is_admin ($true or $false)"}

    ##TODO make this more dynamic with more memes?
    $Password = ConvertTo-SecureString "Hell0 There!" -AsPlainText -Force
    $Description = "...It's not a story windows would tell you."

    #create the user
    New-LocalUser -Name $username -Description $Description -Password $Password

    #add the user to the appropriate group (this sets their permissions)
    if($Is_Admin)   # user is an admin account
    {
        Add-LocalGroupMember -Group "Administrators" -Member $username
    }
    else    # user is a normal account 
    {
        Add-LocalGroupMember -Group "Users" -Member $username
    }
}