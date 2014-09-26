Kapaseety
=========
Require : PHP 5.3+ , MySQL for Website
Vmware PowerCli 5.5 R2 or higher and "Mysql .NET Connector" (http://dev.mysql.com/downloads/file.php?id=450594) for batch job


Description:
Capacity planning for Vsphere 5.0 or higher

Install
 - Rename file config.php_dist to config.php and edit with yours personnals settings.
 - Rename file batch/kapaseety.ps1_dist to kapaseety.ps1 and edit with yours personnals settings.
 - Schedule kapaseety.ps1 with a task scheduler. The Execution User must have READ rights on Vcenter.
