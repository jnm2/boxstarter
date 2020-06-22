function Disable-BingSearch {
<#
.SYNOPSIS
Disables the Bing Internet Search when searching from the search field in the Taskbar or Start Menu.

.LINK
https://boxstarter.org
https://www.privateinternetaccess.com/forum/discussion/18301/how-to-uninstall-core-apps-in-windows-10-and-miscellaneous
https://www.lifehacker.com.au/2020/06/how-to-disable-bing-search-in-windows-10s-start-menu-2/

#>
    $path = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search"

    if(!(Test-Path $path)) {
        New-Item $path
    }

    New-ItemProperty -LiteralPath $path -Name "BingSearchEnabled" -Value 0 -PropertyType "DWord" -ErrorAction SilentlyContinue
    Set-ItemProperty -LiteralPath $path -Name "BingSearchEnabled" -Value 0
    
    $2004path = 'HKCU:\Software\Policies\Microsoft\Windows\Explorer'
    if (!(Test-Path $2004path)) { New-Item $2004path }
    Set-ItemProperty $2004path DisableSearchBoxSuggestions 1
}
