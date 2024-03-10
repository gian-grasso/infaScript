#!/bin/bash
extradim() {
#Extradim
    clear
    printf "\n${RESET}${txtbgblu}${BOLD} I'll redirect u to EXTRADIM settings${RESET}\n
    ${txtinv}${BOLD}Press ENTER to redirect...${RESET}\n"
    read -r a
    if [ $sudocheck -eq 1 ]; then
    su -c am start -n 'com.android.settings/.Settings\$ReduceBrightColorsSettingsActivity'
    clear
    else
    am start -n 'com.android.settings/.Settings\$ReduceBrightColorsSettingsActivity'
    clear
    fi
    printf "\n${RESET}${txtbgred}${BOLD}Press ENTER when u have done...${RESET}\n"
    read -r a
    clear
    start
}

hiddenconnect(){
# Connection Settings
    clear
    printf "\n${RESET}${txtbgblu}${BOLD} I'll redirect u to Hidden Connection settings settings${RESET}\n
    ${txtinv}${BOLD}Press ENTER to redirect...${RESET}\n"
    read -r a
    if [ $sudocheck -eq 1 ]; then
    su am broadcast -a com.samsung.android.action.SECRET_CODE -d android_secret_code://27663368378 -n com.sec.android.RilServiceModeApp/.SecKeyStringBroadcastReceiver
    clear
    else
    am broadcast -a com.samsung.android.action.SECRET_CODE -d android_secret_code://27663368378 -n com.sec.android.RilServiceModeApp/.SecKeyStringBroadcastReceiver
    clear
    fi
    printf "\n${RESET}${txtbgred}${BOLD}Press ENTER when u have done...${RESET}\n"
    read -r a
    clear
    start
}
  }
  

start(){
clear
printf "\n${RESET}${txtbgrst}${BLUE}${BOLD}########## HIDDEN MENU ##########${WHITE}${BOLD}
1.  Extra DIM ${txtbgred}${BOLD}For Samsung only${RESET}
${WHITE}${BOLD}2.  Hidden Connection settings
${MAGENTA}${BOLD}3.  Return to Start
${RED}${BOLD}4.  Exit
\n${RESET}${txtbgrst}${BLUE}${BOLD}########################################${RESET}${BLUE}${BOLD}
Enter your choice: \n"
read -r choice
}


run_me(){

    # Main script logic
    while true; do
        start
    case $choice in
            1)
                extradim
                ;;
            2)  
                ;;
                hiddenconnect
            3)
                exit 0
                ;;
            4)
                pkill -f InfaScript.sh
                ;;
            *)
                printf "\n${RESET}${txtinv}${BOLD}Choose a valid option, press ENTER to continue...${RESET}"
                read -r a
                start
                ;;
        esac
    done
}
checks() {
    if su -c 'true' >/dev/null 2>&1; then
        echo -e "\n${GREEN}${BOLD}[i] Root access found. Starting script...${RESET}\n"
        sleep 1
        clear
        sudocheck="1"
    else
        echo -e "\n${RED}${BOLD}[i] Root access not found. Trying with Shizuku...${RESET}\n"
        sleep 1
        clear
        sudocheck="0"
        exit 1       
    fi
    run_me
}
checks