[CmdletBinding()]
param (
    [string] $InstFile = "SQLEXPR_x64_ENU.exe",
    [string] $CfgFile = "config.ini"
)

$instpath = Join-Path -Path $PSScriptRoot -ChildPath $InstFile
$cfgpath  = Join-Path -Path $PSScriptRoot -ChildPath $CfgFile

if (!(Test-Path $instpath) -or !(Test-Path $cfgpath)) {
    Write-Warning "required files were not found!"
    break
}

try {
    Write-Verbose "running: $instpath /ConfigurationFile=`"$cfgpath`""
    $p = Start-Process -FilePath $instpath -ArgumentList "/ConfigurationFile=`"$cfgpath`"" -Wait -PassThru -ErrorAction SilentlyContinue
    $result = $p.ExitCode
    Write-Output $result
}
catch {
    Write-Output $Error[0].Exception.Message
}
