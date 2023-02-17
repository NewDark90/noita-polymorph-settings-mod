Get-Content "$PSScriptRoot\..\.env" | foreach {
  $name, $value = $_.split('=')
  if ($name.Contains('#') -and [string]::IsNullOrWhiteSpace($name)) {
   continue
  }
  Write-Output $name, $value
  Set-Content env:\$name $value
}

$prevLocation = Get-Location

try {
    Set-Location -Path $env:NOITA_INSTALL_FOLDER
    Invoke-Expression -Command "$env:NOITA_INSTALL_FOLDER\noita_dev.exe -workshop_upload"
}
catch {
    Write-Host $_.ScriptStackTrace
}

Set-Location -Path $prevLocation