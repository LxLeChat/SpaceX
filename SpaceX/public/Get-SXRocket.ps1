function Get-SXRocket {
    <#
    .SYNOPSIS
    Retrieve SpaceX rocket data
    
    .DESCRIPTION
    Retrieve SpaceX rocket data

    .PARAMETER Rocket
    Specify the rocket name
    
    .EXAMPLE
    Get-SXRocket

    .EXAMPLE
    Get-SXRocket -Rocket falconheavy
    
    .NOTES
    https://github.com/lazywinadmin/spacex
    #>
    [CmdletBinding()]
    PARAM($Rocket)
    try{
        if($Rocket)
        {
            $Splat = @{
                Uri = "https://api.spacexdata.com/v3/rockets/$Rocket"
            }
        }
        else{
            $Splat = @{
                Uri = "https://api.spacexdata.com/v3/rockets"
            }
        }

        (Invoke-RestMethod @Splat)
    }
    catch{
        $PSCmdlet.ThrowTerminatingError($_)
    }
}