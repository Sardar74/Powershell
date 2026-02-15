 ## Restart device after 10 min if you dont click "ok", if you click "ok" device will restart immediately
Add-Type -AssemblyName System.Windows.Forms
try {
    $result = [System.Windows.Forms.MessageBox]::Show("Please restart your device in 10 minutes or click OK for an immediate restart.", "Restart Reminder", [System.Windows.Forms.MessageBoxButtons]::OKCancel, [System.Windows.Forms.MessageBoxIcon]::Information)
    if ($result -eq [System.Windows.Forms.DialogResult]::OK) {
        # Immediate restart
        Restart-Computer -Force
    }
} catch {
    Write-Host "An error occurred: $_"
    exit 1
}
} else {
    # Wait for 10 minutes
    Start-Sleep -Seconds 600
    # Restart the device
    Restart-Computer -Force
}

## no user login wait untill 10 min and restart the device
Start-Sleep -Seconds 600
Restart-Computer -Force
