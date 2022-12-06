// Create an ActiveX object for the PowerShell engine
var shell = new ActiveXObject("PowerShell.Application");

// Run the PowerShell script ---- Set powershell script to grab and execute.
var command = "& 'C:\Users\zylarmccullah\Documents\Code\Automation\Win10AutoUpdate.ps1'";
shell.Execute(command);