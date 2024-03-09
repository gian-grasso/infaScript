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

start(){
clear
printf "\n${RESET}${txtbgrst}${BLUE}${BOLD}########## HIDDEN MENU ##########${WHITE}${BOLD}
1.  Extra DIM ${txtbgred}${BOLD}For Samsung only${RESET}
${MAGENTA}${BOLD}2.  Return to Start
${RED}${BOLD}3.  Exit
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
                exit 0
                ;;
            3)
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