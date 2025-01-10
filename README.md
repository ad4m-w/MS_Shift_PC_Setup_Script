# pc_setup
Run this in Powershell using:

$ScriptFromGitHub = Invoke-WebRequest https://raw.githubusercontent.com/ad4m-w/pc_setup/refs/heads/main/PCSetup.ps1

Invoke-Expression $($ScriptFromGitHub.Content)
