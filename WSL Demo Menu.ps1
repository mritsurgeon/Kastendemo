function DisplayMenu {
    Clear-Host
    Write-Host @"
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

"@
$MENU = Read-Host "OPTION"
Switch ($MENU)
    {
    1 {
    #OPTION1 - Install WSL
    wsl --install
    #set to WSL 2 
    wsl --set-default-version 2 
    clear
    Write-Host "Restart to complete install"
    Start-Sleep -Seconds 5
    Restart-Computer
    DisplayMenu
    }
    2 {
    #OPTION2 - Import Custom WSL Tar Image
    #Import WSL image 
    
    wsl --import Ubuntu-kasten .\ .\kasten-demo

    wsl --setdefault Ubuntu-kasten

    Start-Sleep -Seconds 2
    DisplayMenu
    }
    3 {
    #OPTION3 - Start Demo Environment 
    wsl sudo screen -d -m -L -Logfile /var/log/k3s.log k3s server
    wsl sudo kubectl --namespace kasten-io port-forward service/gateway 8080:8000 '&'
    Write-Host " Starting K3s & Kasten Pod "
    Start-Sleep -Seconds 2
    DisplayMenu
    }
    4 {
    #OPTION4 - Open URL run Option3 before  
    Start-Process "http://127.0.0.1:8080/k10/#/dashboard"
    Start-Sleep -Seconds 2
    DisplayMenu
    }
    5 {
    #OPTION5 - App
    Start-Process "http://127.0.0.1:3001/"
    Start-Sleep -Seconds 2
    DisplayMenu
    }
    6 {
    #OPTION5 - EXIT
    Write-Host " Terminating WSL session "
    wsl --terminate Ubuntu-kasten
    Start-Sleep -Seconds 2
    Write-Host "Bye"
    Break
    }
    default {
    #DEFAULT OPTION
    Write-Host "Option not available"
    Start-Sleep -Seconds 2
    DisplayMenu
    }
    }
    }
    DisplayMenu