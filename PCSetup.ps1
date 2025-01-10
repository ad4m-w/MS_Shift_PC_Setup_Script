# Created By Adam Waszczyszak
# Version 1.0
# Lightweight, simple version to enable compatiblity on all systems

$host.ui.RawUI.WindowTitle = "Litetouch setup for new PC's by Adam Waszczyszak"
# Scripts Disabled Bypass from CMD: powershell -ExecutionPolicy Bypass -File "C:\Temp\PC_Setup.ps1"
# Update local group policy if the bypass does not work.

# Self-check for admin rights, and ask for perms if launched not as admin (from Superuser.com)
function Test-Admin {
    $currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
    $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

if ((Test-Admin) -eq $false)  {
    if ($elevated) {
        # tried to elevate, did not work, aborting
    } else {
        Start-Process powershell.exe -Verb RunAs -ArgumentList ('-noprofile -noexit -file "{0}" -elevated' -f ($myinvocation.MyCommand.Definition))
    }
    exit
}

# Disable Quick Edit Mode
Set-ItemProperty -Path 'HKCU:\Console\' -Name QuickEdit -Value 0

# Bypass Execution Policy
Set-ExecutionPolicy Bypass

# Clear Screen after admin check
Clear-Host

# Disabling download progress bar increases download speed significantly.
$ProgressPreference = 'SilentlyContinue'

function Show-Menu {
    Clear-Host
    Write-Host "|Toggle Menu|"
    Write-Host " -----------"
    Write-Host "1. Windows Updates"
    Write-Host "2. Create Temp + Visitor_Pic Folders (with permissions)"
    Write-Host "3. Microsoft Edge Registry Patch"
    Write-Host "4. API (silent)" 
    Write-Host "5. Adobe (silent)"   
    Write-Host "6. HF Scanner DS8108 (silent)"
    Write-Host "7. DYMO 550 (silent)"
    Write-Host "8. Signature Pad"
    Write-Host "9. LX-500 (must be plugged in)"
    Write-Host "10. GK420D"
    Write-Host "11. ZD421"
    Write-Host "12. ZXP-7"
    Write-Host "13. Block DYMO Updates"
    Write-Host "14. Block Adobe Updates"
    Write-Host "15. Disable Windows Updates"
    Write-Host "16. Delete Temp Files"
    Write-Host "17. Edit Email Signature"
    Write-Host "Q. Quit"
}

Show-Menu

$windowsUpdate = $false
$createFolders = $false
$msedgePatch = $false
$silentAPI = $false
$silentAdobe = $false
$silentScanner = $false
$silentDymo = $false
$signaturepad = $false
$lx500 = $false
$gk420d = $false
$zd421 = $false
$zxp = $false
$blockDymo = $false
$blockAdobe = $false
$blockWindows = $false
$deleteTemp = $false
$editSignature = $false

do {

    $choice = Read-Host "Enter your choice"

    switch ($choice) {
        "1" {
            if($windowsUpdate -eq $false){
                $windowsUpdate = $true
                Write-Host "Windows Updates  Enabled"                
            }
            elseif($windowsUpdate -eq $true){
                $windowsUpdate = $false
                Write-Host "Windows Updates  Disabled"                
            }           
        }
        "2" {
            if($createFolders -eq $false){
                $createFolders = $true
                Write-Host "Folder Creation  Enabled"                
            }
            elseif($createFolders -eq $true){
                $createFolders = $false
                Write-Host "Folder Creation  Disabled"                
            }
        }
        "3" {
            if($msedgePatch -eq $false){
                $msedgePatch = $true
                Write-Host "MS Edge  Enabled"                
            }
            elseif($msedgePatch -eq $true){
                $msedgePatch = $false
                Write-Host "MS Edge  Disabled"                
            }
            
        }
        "4" {
            if($silentAPI -eq $false){
                $silentAPI = $true
                Write-Host "Silent Install of API  Enabled"                
            }
            elseif($silentAPI -eq $true){
                $silentAPI = $false
                Write-Host "Silent Install of API  Disabled"                
            }
            
        }  
        "5" {
            if($silentAdobe -eq $false){
                $silentAdobe = $true
                Write-Host "Silent Install of Adobe  Enabled"                
            }
            elseif($silentAdobe -eq $true){
                $silentAdobe = $false
                Write-Host "Silent Install of Adobe  Disabled"                
            }
            
        }      
        "6" {
            if($silentScanner -eq $false){
                $silentScanner = $true
                Write-Host "Silent Install of DS8108  Enabled"                
            }
            elseif($silentScanner -eq $true){
                $silentScanner = $false
                Write-Host "Silent Install of DS8108  Disabled"                
            }           
        }
        "7" {
            if($silentDymo -eq $false){
                $silentDymo = $true
                Write-Host "Silent DYMO Driver  Enabled"                
            }
            elseif($silentDymo -eq $true){
                $silentDymo = $false
                Write-Host "Silent DYMO Driver  Disabled"                
            }
        }
        "8" {
            if($signaturepad -eq $false){
                $signaturepad = $true
                Write-Host "Signature Pad Driver  Enabled"                
            }
            elseif($signaturepad -eq $true){
                $signaturepad = $false
                Write-Host "Signature Pad Driver  Disabled"                
            }
        }
        "9" {
            if($lx500 -eq $false){
                $lx500 = $true
                Write-Host "LX-500 Driver  Enabled"                
            }
            elseif($lx500 -eq $true){
                $lx500 = $false
                Write-Host "LX-500 Driver  Disabled"                
            }
            
        }
        "10" {
            if($gk420d -eq $false){
                $gk420d = $true
                Write-Host "GK-420d Driver  Enabled"                
            }
            elseif($gk420d -eq $true){
                $gk420d = $false
                Write-Host "GK-420d Driver  Disabled"                
            }
            
        }  
        "11" {
            if($zd421 -eq $false){
                $zd421 = $true
                Write-Host "ZD421 Driver  Enabled"                
            }
            elseif($zd421 -eq $true){
                $zd421 = $false
                Write-Host "ZD421 Driver  Disabled"                
            }
            
        }  
        "12" {
            if($zxp -eq $false){
                $zxp = $true
                Write-Host "ZXP-7 Driver  Enabled"                
            }
            elseif($zxp -eq $true){
                $zxp = $false
                Write-Host "ZXP-7 Driver  Disabled"                
            }           
        }
        "13" {
            if($blockDymo -eq $false){
                $blockDymo = $true
                Write-Host "Block DYMO Updates  Enabled"                
            }
            elseif($blockDymo -eq $true){
                $blockDymo = $false
                Write-Host "Block DYMO Updates  Disabled"                
            }
        }
        "14" {
            if($blockAdobe -eq $false){
                $blockAdobe = $true
                Write-Host "Block Adobe Updates  Enabled"                
            }
            elseif($blblockAdobeockAdobe -eq $true){
                $blockAdobe = $false
                Write-Host "Block Adobe Updates  Disabled"                
            }
            
        }
        "15" {
            if($blockWindows -eq $false){
                $blockWindows = $true
                Write-Host "Block Windows Updates  Enabled"                
            }
            elseif($blockWindows -eq $true){
                $blockWindows = $false
                Write-Host "Block Windows Updates  Disabled"               
            }
            
        }  
        "16" {
            if($silentAdobe -eq $false){
                $silentAdobe = $true
                Write-Host "Silent Install of Adobe  Enabled"                
            }
            elseif($silentAdobe -eq $true){
                $silentAdobe = $false
                Write-Host "Silent Install of Adobe  Disabled"                
            }
            
        }      
        "17" {
            if($deleteTemp -eq $false){
                $deleteTemp = $true
                Write-Host "Delete Temp  Enabled"                
            }
            elseif($deleteTemp -eq $true){
                $deleteTemp = $false
                Write-Host "Delete Temp  Disabled"                
            }           
        }
        "18" {
            if($editSignature -eq $false){
                $editSignature = $true
                Write-Host "Edit Email Signature  Enabled"                
            }
            elseif($editSignature -eq $true){
                $editSignature = $false
                Write-Host "Edit Email Signature  Disabled"                
            }
        }

        "Q" {
            Write-Host "Executing Selected Choices..."
            break
        }
        default {
            Write-Host "Invalid choice."
        }
    }
    Write-Host ""
} while ($choice -ne "Q")

if($windowsUpdate -eq $true){

    'Installing Windows Update PS ...'
    Install- -Name NuGet -Force
    Install- -Name PSWindowsUpdate -Force
    'Installing all newest Windows Updates'
    Import- -Name PSWindowsUpdate -Force
    Get-WindowsUpdate -AcceptAll -Install -IgnoreReboot -Verbose
    'Done, remember to restart later!'
}
if($createFolders -eq $true){
    if (Test-Path -Path C:\Temp){
        "Temp Folder Already Exists"
        }

        else{
            New-Item -Path C:\Temp -ItemType Directory
        }

        if (Test-Path -Path C:\Visitor_pic){
            "Visitor_Pic Folder Already Exists"
        }

        else{
            New-Item -Path C:\Visitor_pic -ItemType Directory
        }

        'Folders Created.'

        $path=Get-Acl -Path C:\Temp
        $acl=New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule ('BUILTIN\Users','FullControl','ContainerInherit, ObjectInherit','None','Allow')
        $path.setaccessrule($acl)
        Set-Acl -Path C:\Temp\ -AclObject $path


        $path=Get-Acl -Path C:\Visitor_pic
        $acl=New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule ('BUILTIN\Users','FullControl','ContainerInherit, ObjectInherit','None','Allow')
        $path.setaccessrule($acl)
        Set-Acl -Path C:\Visitor_pic\ -AclObject $path

        "Permissions for Temp and Visitor_Pics Set!"
}
if($msedgePatch -eq $true){
    $regContent = @"
    Windows Registry Editor Version 5.00
    ;Disable IE11 Welcome Screen
    [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\Main]
    "DisableFirstRunCustomize"=dword:00000001 
"@

    # Create a temporary .reg file
    $tempFile = New-TemporaryFile 
    $tempFile.FullName 
    $regContent | Out-File -FilePath $tempFile.FullName -Encoding ASCII

    # Import the registry settings
    reg.exe import $tempFile.FullName

    # Clean up the temporary file
    Remove-Item $tempFile.FullName  
}
if($silentAPI -eq $true){
    'Parsing download site for API Download Link...'     
    # Retrieve the HTML content of the website
    $response = Invoke-WebRequest -Uri "https://download.msshift.com/link/e2d06108-8cc8-4705-a316-54463dc1d78f"
    # Extract the text content from the parsed HTML
    $text = $response.ParsedHtml.body.innerText
    'Downloading...'
    $Destination = "C:\Temp\api.zip" 
    Invoke-WebRequest -Uri $text -OutFile $Destination
    'Uncompressing...'
    Expand-Archive -LiteralPath 'C:\Temp\api.zip' -DestinationPath C:\Temp
    "Launching API with silent installer params..."
    Start-Process -FilePath "C:\Temp\MSShift.DevicesAPI.Setup.NEW.msi" -ArgumentList "/passive", "/norestart"
    "Success!"
    Read-Host -Prompt "Press any key to continue..."
}
if($silentAdobe -eq $true){
    'Parsing download site for Adobe Installer...'
    # Retrieve the HTML content of the website
    $response = Invoke-WebRequest -Uri "https://download.msshift.com/link/5da99203-21ba-4aa2-93e6-a60a8a0b3ae3"
    # Extract the text content from the parsed HTML
    $text = $response.ParsedHtml.body.innerText
    'Downloading...'
    $Destination = "C:\Temp\adobe.exe" 
    Invoke-WebRequest -Uri $text -OutFile $Destination
    "Launching Adobe with silent installer params..."
    Start-Process -FilePath "C:\Temp\adobe.exe" -ArgumentList "/sPB"
    "Success!"
    Read-Host -Prompt "Press any key to continue..."    
}
if($silentScanner -eq $true){
    'Parsing download site for DS8108 driver...'
    # Retrieve the HTML content of the website
    $response = Invoke-WebRequest -Uri "https://download.msshift.com/link/c862d6fc-fc72-4e77-8347-ab079c8d4fa3"
    # Extract the text content from the parsed HTML
    $text = $response.ParsedHtml.body.innerText
    'Downloading driver...'

    $Destination = "C:\Temp\Zebra_CoreScanner_Driver.exe" 
    Invoke-WebRequest -Uri $text -OutFile $Destination

    'Parsing download site for PDF downloads...'
    # Retrieve the HTML content of the website
    $response = Invoke-WebRequest -Uri "https://download.msshift.com/link/76cdef97-2774-4b11-9adb-14b0220159f5"
    # Extract the text content from the parsed HTML
    $text = $response.ParsedHtml.body.innerText

    'Downloading Restore Default PDF...'

    $Destination = "C:\Temp\Restore Default.pdf" 
    Invoke-WebRequest -Uri $text -OutFile $Destination

    # Retrieve the HTML content of the website
    $response = Invoke-WebRequest -Uri "https://download.msshift.com/link/e5a5d996-6a66-400b-a2c7-548627642815"
    # Extract the text content from the parsed HTML
    $text = $response.ParsedHtml.body.innerText

    'Downloading ScanX_Config_Codebar PDF...'

    $Destination = "C:\Temp\ScanX_Config_Codebar.pdf" 
    Invoke-WebRequest -Uri $text -OutFile $Destination

$issContent = @"
[{C96D0CF9-799F-4332-81FF-130C0F58AB0C}-DlgOrder]
Dlg0={C96D0CF9-799F-4332-81FF-130C0F58AB0C}-SdWelcome-0
Count=4
Dlg1={C96D0CF9-799F-4332-81FF-130C0F58AB0C}-SetupType2-0
Dlg2={C96D0CF9-799F-4332-81FF-130C0F58AB0C}-SdStartCopy2-0
Dlg3={C96D0CF9-799F-4332-81FF-130C0F58AB0C}-SdFinish-0
[{C96D0CF9-799F-4332-81FF-130C0F58AB0C}-SdWelcome-0]
Result=1
[{C96D0CF9-799F-4332-81FF-130C0F58AB0C}-SetupType2-0]
Result=304
[{C96D0CF9-799F-4332-81FF-130C0F58AB0C}-SdStartCopy2-0]
Result=1
[{C96D0CF9-799F-4332-81FF-130C0F58AB0C}-SdFinish-0]
Result=1
bOpt1=0
bOpt2=0
"@

   $issFilePath = "C:\Temp\custom.iss"
   $issContent | Out-File -FilePath $issFilePath -Encoding ascii
   "iss Config File created in Temp folder..."

    "Launching Hands Free Scanner with silent installer params..."

   # Define the path to the executable and the parameters
   $exePath = "C:\Temp\Zebra_CoreScanner_Driver.exe"   
   $issFilePath = "C:\Temp\custom.iss"

   # Launch the CMD and run the zebra.exe with the specified arguments
   Start-Process "cmd.exe" -ArgumentList "/c", "$exePath -s -f1`"$issFilePath`""

   Read-Host -Prompt "CMD launched with Zebra Installer and arguments. Press any key to continue..." 
}
if($signaturepad -eq $true){
    'Parsing download site for Signature Pad driver...'
    # Retrieve the HTML content of the website
    $response = Invoke-WebRequest -Uri "https://download.msshift.com/link/e43d957b-0b20-4422-a3d0-a114162c5dfe"
    # Extract the text content from the parsed HTML
    $text = $response.ParsedHtml.body.innerText
    'Downloading...'
    $Destination = "C:\Temp\sigplus_.exe" 
    Invoke-WebRequest -Uri $text -OutFile $Destination
    "Launching Signature Pad installer..."
    Start-Process -FilePath "C:\Temp\sigplus_.exe"
    "Success!"
    Read-Host -Prompt "Press any key to continue..." 
}
if($lx500 -eq $true){
    'Parsing download site for LX-500 driver...'
    # Retrieve the HTML content of the website
    $response = Invoke-WebRequest -Uri "https://download.msshift.com/link/7ebdd547-4c3c-4dc4-8639-e0ce88c1f60c"
    # Extract the text content from the parsed HTML
    $text = $response.ParsedHtml.body.innerText
    'Downloading...'
    $Destination = "C:\Temp\Primera.2.3.1.exe" 
    Invoke-WebRequest -Uri $text -OutFile $Destination
    "Launching LX 500 installer..."
    Start-Process -FilePath "C:\Temp\Primera.2.3.1.exe"
    "Success!"
    Read-Host -Prompt "Press any key to continue..."
}
if($gk420d -eq $true){
    'Parsing download site for GK 420d driver...'
    # Retrieve the HTML content of the website
    $response = Invoke-WebRequest -Uri "https://download.msshift.com/link/2923c379-b7a0-4506-9c28-4ea5b2c0e48c"
    # Extract the text content from the parsed HTML
    $text = $response.ParsedHtml.body.innerText
    'Downloading...'
    $Destination = "C:\Temp\zd51.exe" 
    Invoke-WebRequest -Uri $text -OutFile $Destination
    "Launching GK420d driver installer..."
    Start-Process -FilePath "C:\Temp\zd51.exe"
    "Success!"
    Read-Host -Prompt "Press any key to continue..."
}
if($zd421 -eq $true){
    'Parsing download site for ZD421 driver...'
    # Retrieve the HTML content of the website
    $response = Invoke-WebRequest -Uri "https://download.msshift.com/link/75b8f783-51f0-4a8a-9128-bf6957480aa4"
    # Extract the text content from the parsed HTML
    $text = $response.ParsedHtml.body.innerText
    'Downloading...'
    $Destination = "C:\Temp\zd105.exe" 
    Invoke-WebRequest -Uri $text -OutFile $Destination
    "Launching ZD421/420 driver installer..."
    Start-Process -FilePath "C:\Temp\zd105.exe"
    "Success!"
    Read-Host -Prompt "Press any key to continue..."
}
if($zxp -eq $true){
    'Parsing download site for ZXP-7...'
    # Retrieve the HTML content of the website
    $response = Invoke-WebRequest -Uri "https://download.msshift.com/link/7cc7f865-5107-4f8b-9f3e-617b8ca23802"
    # Extract the text content from the parsed HTML
    $text = $response.ParsedHtml.body.innerText
    'Downloading...'
    $Destination = "C:\Temp\ZXP73.0.2.exe" 
    Invoke-WebRequest -Uri $text -OutFile $Destination
    "Launching ZXP-7 driver installer..."
    Start-Process -FilePath "C:\Temp\ZXP73.0.2.exe"
    "Success!"
    Read-Host -Prompt "Press any key to continue..."
}
if($silentDymo -eq $true){
    'Parsing download site for DYMO 550 driver...'
    # Retrieve the HTML content of the website
    $response = Invoke-WebRequest -Uri "https://download.msshift.com/link/1ab37806-4228-4eb1-8178-1ba492b0ea0f"
    # Extract the text content from the parsed HTML
    $text = $response.ParsedHtml.body.innerText
    'Downloading...'
    $Destination = "C:\Temp\DCDSetup1.4.5.1.exe" 
    Invoke-WebRequest -Uri $text -OutFile $Destination
    "Launching DYMO 550 driver with silent installer params..."
    Start-Process -FilePath "C:\Temp\DCDSetup1.4.5.1.exe" -ArgumentList "/S", "/v/qn"
    "Success!"
    Read-Host -Prompt "Press any key to continue..."
}
if($blockDymo -eq $true){
    'Blocking services...'
    New-NetFirewallRule -Program "C:\Program Files (x86)\DYMO\DYMO Connect\DYMOConnect.exe" -Action Block -Profile Domain, Private, Public -DisplayName “Block DYMO Connect” -Description “Block DYMO Connect” -Direction Outbound | Format-Table -AutoSize -Property DisplayName, Enabled, Direction, Action  
    New-NetFirewallRule -Program "C:\Program Files (x86)\DYMO\DYMO Connect\DYMO.WebApi.Win.Host.exe" -Action Block -Profile Domain, Private, Public -DisplayName “Block DYMO WebService” -Description “Block DYMO WebService” -Direction Outbound | Format-Table -AutoSize -Property DisplayName, Enabled, Direction, Action 
}
if($blockAdobe -eq $true){
    Set-Service -Name "AdobeARMservice" -StartupType Disabled
    "Adobe Update Services Blocked In Services.msc"
}
if($blockWindows -eq $true){
        sc.exe query wuauserv
        sc.exe stop wuauserv
        sc.exe config wuauserv start=disabled
        'Start Value should be 0x4'
        REG.exe QUERY HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wuauserv /v Start
        'Disable scheduled task'
        Get-ScheduledTask -TaskPath '\Microsoft\Windows\WindowsUpdate\'  | Disable-ScheduledTask -ErrorAction SilentlyContinue
}
if($deleteTemp -eq $true){
    'Removing all drivers from Temp Folder...'
    if(Test-Path "C:\Temp\api.zip" ){
         Remove-Item "C:\Temp\api.zip"
        'API files deleted!'
    }

    if(Test-Path "C:\Temp\MSShift.DevicesAPI.Setup.NEW.msi"){
         Remove-Item "C:\Temp\MSShift.DevicesAPI.Setup.NEW.msi"
    }

    if(Test-Path "C:\Temp\adobe.exe"){
         Remove-Item "C:\Temp\adobe.exe"
         'Adobe files removed!'
    }

    if(Test-Path "C:\Temp\sigplus_.exe"){
         Remove-Item "C:\Temp\sigplus_.exe"
         'Signature Pads files removed!'
    }

    if(Test-Path "C:\Temp\Zebra_CoreScanner_Driver.exe"){
         Remove-Item "C:\Temp\Zebra_CoreScanner_Driver.exe"
         'Scanner files removed!'
    }

    if(Test-Path "C:\Temp\Restore Default.pdf"){
         Remove-Item "C:\Temp\Restore Default.pdf"
         'PDFs Removed!'
    }

    if(Test-Path "C:\Temp\ScanX_Config_Codebar.pdf"){
         Remove-Item "C:\Temp\ScanX_Config_Codebar.pdf"
    }

    if(Test-Path "C:\Temp\Zebra123_CoreScanner_Driver.exe" ){
         Remove-Item "C:\Temp\Zebra123_CoreScanner_Driver.exe"
         'Scanner files removed!'
    }

    if(Test-Path "C:\Temp\Primera.2.3.1.exe"){
         Remove-Item "C:\Temp\Primera.2.3.1.exe"  
         'LX 500 files removed!'
    }

    if(Test-Path "C:\Temp\DCDSetup1.4.5.1.exe"){
         Remove-Item "C:\Temp\DCDSetup1.4.5.1.exe"
         'DYMO files removed!'  
    }

    
    if(Test-Path "C:\Temp\DCDSetup1.3.2.18.exe"){
         Remove-Item "C:\Temp\DCDSetup1.3.2.18.exe"  
         'DYMO files removed!'
    }
                
    if(Test-Path "C:\Temp\zd51.exe"){
         Remove-Item "C:\Temp\zd51.exe"  
         'ZD files removed!'
    }

    if(Test-Path "C:\Temp\zd.exe"){
         Remove-Item "C:\Temp\zd.exe"  
         'ZD files removed!'
    }

    if(Test-Path "C:\Temp\zd105.exe"){
         Remove-Item "C:\Temp\zd105.exe" 
         'ZD files removed!' 
    }

    if(Test-Path "C:\Temp\ZXP73.0.2.exe"){
         Remove-Item "C:\Temp\ZXP73.0.2.exe"  
         'ZXP-7 files removed!'
    }
    'Temp folder cleaned!'
}
if($editSignature -eq $true){
'WIP...'
}