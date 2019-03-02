# Set-IntelXTUControls
Tunes multiple Intel(R) Extreme Tuning Utility (Intel(R) XTU) controls in batch.

## Requirements
* [Intel(R) Extreme Tuning Utility (Intel(R) XTU)](https://downloadcenter.intel.com/download/24075/Intel-Extreme-Tuning-Utility-Intel-XTU)

## Usage
### Example
```PowerShell
.\Set-IntelXTUControls.ps1 -XtuCLIExe 'C:\Program Files (x86)\Intel\Intel(R) Extreme Tuning Utility\Client\XtuCLI.exe' -Settings @{'48' = '85'; '47' = '120'; '49' = '1'; '66' = '5'; '29' = '42'; '30' = '42'; '31' = '42'; '32' = '42'}
```
The above command sets the following:
* Turbo Boost Power Max to 85 watts.
* Turbo Boost Short Power Max to 120 watts.
* Enables Turbo Boost Short Power Max.
* Turbo Boost Power Time Window to 5 seconds.
* Maximum multiplier when 1 core is active to 42.
* Maximum multiplier when 2 cores are active to 42.
* Maximum multiplier when 3 cores are active to 42.
* Maximum multiplier when 4 cores are active to 42.

### Parameters
#### `-XtuCLIExe <String>`
Path to the Intel(R) Extreme Tuning Utility's `XtuCLI.exe` file.

#### `-Settings <Hashtable>`
A hashtable consisting of `'ID' = 'value'` pairs.
Change only the values, IDs correspond to settings listed in the
comments to their right. 

Available IDs are:
* '48' Turbo Boost Power Max
* '47' Turbo Boost Short Power Max
* '49' Turbo Boost Short Power Max Enable
* '66' Turbo Boost Power Time Window
* '58' Processor Graphics Current Limit
* '57' Core Current Limit
* '46' Additional Turbo Voltage
* '80' Overclocking Lock
* '50' Package Turbo Power Lock
* '0'  Max Non Turbo Boost Ratio
* '41' Enhanced Intelr SpeedStep Technology
* '26' Intelr Turbo Boost Technology
* '73' Memory Clock Multiplier
* '29' 1 Active Core
* '30' 2 Active Cores
* '31' 3 Active Cores	
* '32' 4 Active Cores

Run `XtuCLI.exe -info all` to get all info on IDs.

## Authors
* **Violet Haze Roś** - code@unsola.ci

## License
This project is licensed under the
[Mozilla Public License 2.0](https://mozilla.org/MPL/2.0/).
See the [LICENSE](LICENSE) file for details.