# Kastendemo

WSL2 Ubuntu Export Tar with Kasten k10 & Yelb App Pre-Installed 

CD to directory
Git clone https://github.com/mritsurgeon/Kastendemo
CD to directory "Kasten WSL Demo"
Run "WSL Demo Menu.ps1" from powershell in a Admin session 

#Note WSL image is too large for Github free cloud storage , have this hosted on Google Drive Here: http:xxxxx
Please download and copy to folder cloned from github 

with PS or CMD
CD to directory "Kasten WSL Demo"
then: 
curl http:xxxxxx
or 
Invoke-WebRequest http:xxxxx


Navigate Menu : 

    +===============================================+
    |  Kasten Demo Lab Setup - USER MENU            | 
    +===============================================+
    |                                               |
    |    1) Install WSL 2 ( Reboot Required )       |
    |    2) Import Custom Kasten Demo Image         |
    |    3) Start Demo Environment                  |
    |    4) Kasten Console                          |
    |    5) Open Demo App                           |
    |    6) Exit                                    |
    +===============================================+

    **NB WSL image Default User & Password 
    User : demo
    Password : demo

    Written by Ian Englbrecht ( Veeam Africa )

If WSL2 is not yet installed on device run option 1 First , rebot and then run option2

Option 2 will import custome Tar with pre configured Kasten K10 & demo app pre-installed

Option 3 will start K3s & expose URLs for K10 & App

Option 4 will open the K10 URL for you ( using localhost , should work on most systems ) 

Option 5 will open the Demo app URL for you ( using localhost , should work on most systems ) 

Option 6 will Terminate the Kasten-demo WSL image running on exit.

## i would recommendyou create a .wslconfig file in C:\Users\User root directory to limit usuage on device 

Example wslconfig :

[wsl2]
memory=8gb
swap=8



