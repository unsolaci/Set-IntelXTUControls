<#License
This Source Code Form is subject to the terms of the Mozilla Public
License, v. 2.0. If a copy of the MPL was not distributed with this
file, You can obtain one at https://mozilla.org/MPL/2.0/.
#>

<#PSScriptInfo
.VERSION 1.0.0
.DESCRIPTION Tunes multiple Intel(R) Extreme Tuning Utility controls in batch.

.AUTHOR Violet Haze Roś (code@unsola.ci)
.PROJECTURI 

.COPYRIGHT Copyright (C) 2019 Violet Haze Roś <code@unsola.ci>
.LICENSEURI https://mozilla.org/MPL/2.0/

.GUID d08c6010-d6a2-4356-af43-73eb15c3a5e7
#>

<#
.SYNOPSIS 
    Tunes multiple Intel(R) Extreme Tuning Utility controls in batch.

.EXAMPLE
    PS> .\Set-IntelXTUControls.ps1 -Settings @{'48' = '85'; '47' = '120'; '49' = '1'; '66' = '5'; '29' = '42'; '30' = '42'; '31' = '42'; '32' = '42'}
    The above command sets the following:
    * Turbo Boost Power Max to 85 watts.
    * Turbo Boost Short Power Max to 120 watts.
    * Enables Turbo Boost Short Power Max.
    * Turbo Boost Power Time Window to 5 seconds.
    * Maximum multiplier when 1 core is active to 42.
    * Maximum multiplier when 2 cores are active to 42.
    * Maximum multiplier when 3 cores are active to 42.
    * Maximum multiplier when 4 cores are active to 42.
#>

#Requires -Version 2

Param(
    # Path to the Intel(R) Extreme Tuning Utility's `XtuCLI.exe` file
    [string]$XtuCLIExe = 'C:\Program Files (x86)\Intel\Intel(R) Extreme Tuning Utility\Client\XtuCLI.exe',

    [hashtable]$Settings = @{
        # 'ID' = 'value'
        # Change only the values, IDs correspond to settings listed in the
        # comments to their right
        # Available IDs:
        '48' = ''; # * '48' Turbo Boost Power Max
        '47' = ''; # * '47' Turbo Boost Short Power Max
        '49' = ''; # * '49' Turbo Boost Short Power Max Enable
        '66' = ''; # * '66' Turbo Boost Power Time Window
        '58' = ''; # * '58' Processor Graphics Current Limit
        '57' = ''; # * '57' Core Current Limit
        '46' = ''; # * '46' Additional Turbo Voltage
        '80' = ''; # * '80' Overclocking Lock
        '50' = ''; # * '50' Package Turbo Power Lock
        '0'  = ''; # * '0'  Max Non Turbo Boost Ratio
        '41' = ''; # * '41' Enhanced Intelr SpeedStep Technology
        '26' = ''; # * '26' Intelr Turbo Boost Technology
        '73' = ''; # * '73' Memory Clock Multiplier
        '29' = ''; # * '29' 1 Active Core
        '30' = ''; # * '30' 2 Active Cores
        '31' = ''; # * '31' 3 Active Cores	
        '32' = ''  # * '32' 4 Active Cores
        # Run `XtuCLI.exe -info all` to get all info on IDs
    }
)

foreach ($setting in $Settings.GetEnumerator()) {
    if ( ($null -ne $setting.Value) -and ('' -ne $setting.Value) ) {
        Start-Process `
            -Wait `
            -NoNewWindow `
            -FilePath $XtuCLIExe `
            -ArgumentList "-tune -id $($setting.Name) -v $($setting.Value)"
    }
}