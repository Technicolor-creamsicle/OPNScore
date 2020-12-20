function Get-Acc-Existence {
    param (
        $Username
    )
    
    #makes parameter required in a non annoying way
    if(-not($Username)) {Throw "Usage: Get-Acc-Existence -Username 'string'"}

    $Exists = $true

    try { Get-LocalUser $Username -erroraction Stop}
    catch { $Exists = $false }

    return $Exists
}


Get-Acc-Existence -Username "Michael"