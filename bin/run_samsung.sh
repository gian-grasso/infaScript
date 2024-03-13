#!/bin/bash

export RED='\033[1;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[1;33m'
export BOLD='\033[1m'
export BLUE='\033[0;34m'
export RESET='\033[0m'
export BOLD_GREEN='\033[1;32m'
export BOLD_WHITE='\033[1;37m'

exit_a() {
    printf "\n${RESET}${txtbgred}Do you want to exit? (Y/n): ${RESET}\n"
    read -n 1 input
    case $input in
        [yY])
            printf "\n   ${RESET}${RED}${UNDERLINE}Press ENTER to exit ${RESET}\n" 
            read -r a 
            pkill -f InfaScript.sh
            pkill -f run_samsung.sh
            ;;
        [nN])
            printf "${RED}\nPress \"Enter\" to return to the 'Android Tweaker' menu again${RESET}" ; read -r a ; printf "\n%.0s" {1..100} ; clear; start
            ;;
        *)
            printf "\n${RED}[!] Choose a valid option.${RESET}\n"
            read -r a
            exit_a
            ;;
    esac
}

confirm_and_execute() {
    printf "${BLUE}\nAre you sure? (Y/n): "
    read -n 1 confirm_choice
    case $confirm_choice in
        [Yy])
            return 0 ;; # Indica che la conferma è stata data correttamente
        [nN])
            printf "${RED}\nPress \"Enter\" to return to the 'Android Tweaker' menu again${RESET}" ; read -r a ; printf "\n%.0s" {1..100} ; clear; start
            ;;
        *)
            printf "\n${RED}[!] Choose a valid option.${RESET}\n"
            read -r a 
            confirm_and_execute
            ;;
    esac
    return 1 # Indica che la conferma non è stata data correttamente
}

net_band() {
    printf "\n${RESET}   ${BLUE}${BOLD}########## Change Network Bands ##########${RESET}\n\n"
    sleep 1
    printf "   ${YELLOW}[i] This will redirect you to the 'Service mode' menu.${RESET}\n" ; sleep 1
    sleep 1
    printf "   ${YELLOW}[i] Refer to the guide below for better understanding, then come back again.${RESET}\n\n" ; sleep 2
    nohup am start -a android.intent.action.VIEW -d https://t.me/SamsungTweaks/221 >/dev/null 2>&1 &
    printf "   ${YELLOW}[i] Press ENTER when you are ready${RESET}\n\n"
    read -r a
    am broadcast -a com.samsung.android.action.SECRET_CODE -d android_secret_code://27663368378 -n com.sec.android.RilServiceModeApp/.SecKeyStringBroadcastReceiver
    printf "   ${BOLD_GREEN}\n\n[+] Execution Succeed..! \n\nPress \"Enter\" to return to the 'Samsung Tweaks' menu again${RESET}" ; read -r a ; start
}

net_band_lock() {
    printf "\n${RESET}   ${BLUE}${BOLD}########## Lock Network Bands ##########${RESET}\n\n"
    sleep 1
    printf "   ${YELLOW}[i] This will redirect you to the 'Service mode' menu.${RESET}\n" ; sleep 1
    printf "   ${YELLOW}[i] Press ENTER when you are ready${RESET}\n\n"
    read -r a
    am start com.samsung.android.app.telephonyui/.hiddennetworksetting.MainActivity
    printf "   ${BOLD_GREEN}\n\n[+] Execution Succeed..! \n\n${RESET}"
    printf "${RED}Press \"Enter\" to return to the 'Samsung Tweaks' menu again${RESET}" ; read -r a ; printf "\n%.0s" {1..100} ; clear; start
}

extradim() {
#Extradim
   printf "\n${RESET}   ${BLUE}${BOLD}########## Extra Dim ##########${RESET}\n\n"
   
    if su -c 'true' >/dev/null 2>&1; then
      sleep 1
    printf "   ${YELLOW}[i] This will redirect you to the 'Extra Dim' menu.${RESET}\n" ; sleep 1
    printf "   ${YELLOW}[i] Press ENTER when you are ready${RESET}\n\n"
    read -r a  
      su -c am start -n 'com.android.settings/.Settings\$ReduceBrightColorsSettingsActivity'
   printf "   ${BOLD_GREEN}\n\n[+] Execution Succeed..! \n\n${RESET}"
   else
   printf "   ${RED}[i] You are not rooted, cannot run this tweaks.${RESET}\n" ; sleep 1
   fi
    printf "${RED}Press \"Enter\" to return to the 'Samsung Tweaks' menu again${RESET}" ; read -r a ; printf "\n%.0s" {1..100} ; clear; start
}

gestures(){
    #Gesture Settings
      printf "\n${RESET}   ${BLUE}${BOLD}########## Gesture Settings ##########${RESET}\n\n"
   
    if su -c 'true' >/dev/null 2>&1; then
      sleep 1
    printf "   ${YELLOW}[i] This will redirect you to the 'Gesture Settigns' menu.${RESET}\n" ; sleep 1
    printf "   ${YELLOW}[i] Press ENTER when you are ready${RESET}\n\n"
    read -r a  
      su -c am start -n 'com.android.settings/.Settings\$GestureNavigationSettingsActivity'
   printf "   ${BOLD_GREEN}\n\n[+] Execution Succeed..! \n\n${RESET}"
   else
   printf "   ${RED}[i] You are not rooted, cannot run this tweaks.${RESET}\n" ; sleep 1
   fi
    printf "${RED}Press \"Enter\" to return to the 'Samsung Tweaks' menu again${RESET}" ; read -r a ; printf "\n%.0s" {1..100} ; clear; start   
}

deknox() {
    disable() {
        pm disable-user --user 0 com.samsung.android.knox.analytics.uploader
        pm disable-user --user 0 com.samsung.android.bbc.bbcagent
        pm disable-user --user 0 com.knox.vpn.proxyhandler
        pm disable-user --user 0 com.samsung.android.knox.containercore
        pm disable-user --user 0 com.samsung.knox.keychain
        pm disable-user --user 0 com.sec.enterprise.knox.attestation
        pm disable-user --user 0 com.sec.enterprise.knox.cloudmdm.smdms
        pm disable-user --user 0 com.samsung.android.knox.kpecore
        pm disable-user --user 0 com.samsung.android.knox.pushmanager
        pm disable-user --user 0 com.samsung.knox.securefolder

        printf "\n   ${YELLOW}[i] Knox disabled.${RESET}\n\n"
        printf "${RED}   Press \"Enter\" to return to the 'Samsung Tweaks' menu again${RESET}" ; read -r a ; printf "\n%.0s" {1..100} ; clear ; start
    }

    enable() {
        pm enable com.samsung.android.knox.analytics.uploader
        pm enable com.samsung.android.bbc.bbcagent
        pm enable com.knox.vpn.proxyhandler
        pm enable com.samsung.android.knox.containercore
        pm enable com.samsung.knox.keychain
        pm enable com.sec.enterprise.knox.attestation
        pm enable com.sec.enterprise.knox.cloudmdm.smdms
        pm enable com.samsung.android.knox.kpecore
        pm enable com.samsung.android.knox.pushmanager
        pm enable com.samsung.knox.securefolder

        printf "\n   ${YELLOW}[i] Knox Enabled.${RESET}\n\n"
        printf "${RED}   Press \"Enter\" to return to the 'Samsung Tweaks' menu again${RESET}" ; read -r a ; printf "\n%.0s" {1..100} ; clear ; start
    }

    printf "\n${RESET}   ${BLUE}${BOLD}########## De-Knox ##########${RESET}\n\n"
    sleep 1
    printf "   ${YELLOW}[i] This might break certain Knox-based features.${RESET}\n\n"
    printf "   ${BOLD_WHITE}Choose an option:\n\n${RESET}"
    printf "   1. Disable Knox.\n"
    printf "   2. Enable Knox.\n"
    printf "   3. Return to 'Samsung Tweaks' menu\n\n"
    printf "   (Enter 1, 2 or 3): "
    read -r choice

    case $choice in
        1) 
            confirm_and_execute || return 
            disable ;;
        2)
            confirm_and_execute || return  
            enable ;;
        3) 
            confirm_and_execute || return 
            start ;;
        *)
            printf "\n${RED}[!] Please choose a valid option.${RESET}\n"
            read -r a
            deknox
            ;;
    esac
}

change_csc() {
    printf "\n${RESET}   ${BLUE}${BOLD}########## Change CSC ##########${RESET}\n\n"
    sleep 1
    printf "   ${YELLOW}[i] Always check /optics or /product to ensure the required CSC folder is available.${RESET}\n\n"
    printf "   ${YELLOW}[i] If you choose the wrong CSC code, the entire CSC features will break.${RESET}\n\n"
    printf "   ${RED}[i] DO AT YOUR OWN RISK..!${RESET}\n\n"
    printf "   ${BOLD_WHITE}Choose an option:\n\n${RESET}"
    printf "   1. Proceed to change CSC.\n"
    printf "   2. Return to the main menu.\n\n"
    printf "   (Enter 1 or 2): "
    read -r choice

    case $choice in
        1)
            confirm_and_execute || return 
            current_csc=$(cat /efs/imei/mps_code.dat)
            printf "\n   ${YELLOW}[*] Your Current CSC : ${BOLD_WHITE}%s${RESET}\n\n" "$current_csc"

            # Read the CSC code
            printf "   ${YELLOW}[?] Enter your Desired CSC: ${RESET}"
            read -r csc_code

            # Check for null value or value with spaces
            if [ -z "$csc_code" ] || [[ "$csc_code" == *" "* ]]; then
                printf "\n   ${RED}[!] Error: Invalid CSC code. Please enter a valid code.${RESET}\n\n"
                change_csc
                return
            fi

            # Check for simple letters in CSC code
            if [[ "$csc_code" != *[!\ ]* ]]; then
                printf "\n   ${RED}[!] Error: CSC code should contain at least one non-space character.${RESET}\n\n"
                change_csc
                return
            fi

            # Update the CSC code
            printf "\n"

            # To printf "\n%.0s" {1..100} ; clear the current values
            > /efs/imei/mps_code.dat ; > /efs/imei/omcnw_code.dat
            echo "$csc_code" > /efs/imei/mps_code.dat ; echo "$csc_code" > /efs/imei/omcnw_code.dat
            printf "   ${GREEN}[+] CSC has been updated to: ${BOLD_WHITE}%s${RESET}\n\n" "$csc_code"
            printf "   ${YELLOW}[i] Execution Succeed..! ${RESET}\n\n"
            printf "${RED}   Press \"Enter\" to return to the 'Samsung Tweaks' menu again${RESET}" ; read -r a ; printf "\n%.0s" {1..100} ; clear ; start
            ;;
        2)
            confirm_and_execute || return 
            start ;;
        *)
            printf "\n   ${RED}[!] Please choose a valid option.${RESET}\n"
            read -r a
            change_csc
            ;;    
    esac        
}

start() {
    printf "\n%.0s" {1..100} ; clear
    printf "\n\n${RESET}    ${BLUE}########## Samsung Tweaks v1 ##########${RESET}\n\n"
    printf "    ${BOLD_WHITE}Choose what to do?\n${RESET}"
    printf "    1.  Change Network Band (root)\n"
    printf "    2.  Lock Network Bands (root)\n"
    printf "    3.  De-Knox\n"
    printf "    4.  Change CSC (root)\n"
    printf "    5.  Extra Dim\n"
    printf "    6.  Gesture Settings\n"
    printf "${MAGENTA}    7. Return to start\n"
    printf "${RED}    8. Exit\n"

    printf "    ${RESET}${BLUE}##############################${RESET}\n"
    
    printf "   Enter your choice: "
    read -r choice

    case $choice in
        1)
            confirm_and_execute || return 
            net_band ;;
        2)
            confirm_and_execute || return
            net_band_lock ;;
        3) 
            confirm_and_execute || return
            deknox ;;
        4)
            confirm_and_execute || return
            change_csc ;;
        5) 
            confirm_and_execute || return
            extradim ;;
        6)
            confirm_and_execute || return
            gestures ;;
        7)
            confirm_and_execute || return
            printf "\n   ${RESET}${UNDERLINE}${BOLD}Press ENTER to return to Start${RESET}"
            read -r a
            exit 0 ;;
        8)
            exit_a ;;
        *)
            printf "\n${RED}[!] Choose a valid option.${RESET}\n"
            read -r a
            start
            ;;
    esac
}

start