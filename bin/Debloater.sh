#!/bin/bash

exit_a() {
    printf "\n${RESET}${txtbgred}Do you want to exit? (Y/n): ${RESET}\n"
    read -n 1 input
    case $input in
        [yY])
            printf "\n   ${RESET}${RED}${UNDERLINE}Press ENTER to exit ${RESET}\n" 
            read -r a 
            pkill -f InfaScript.sh
            pkill -f Debloater.sh
            ;;
        [nN])
            printf "${RED}\nPress \"Enter\" to return to the 'Debloat' menu again${RESET}" ; read -r a ; printf "\n%.0s" {1..100} ; clear; start
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
            printf "${RED}\nPress \"Enter\" to return to the 'Debloat' menu again${RESET}" ; read -r a ; printf "\n%.0s" {1..100} ; clear; start
            ;;
        *)
            printf "\n${RED}[!] Choose a valid option.${RESET}\n"
            read -r a 
            confirm_and_execute
            ;;
    esac
    return 1 # Indica che la conferma non è stata data correttamente
}

uninstall_from_list() {
    local list_file="$1"
    printf "\n\n${RESET}    ${BLUE}########## Uninstalling Apps ##########${RESET}\n\n"
    while IFS= read -r app || [ -n "$app" ]; do
        if [ -n "$app" ]; then
            pm uninstall -k --user 0 "$app"
            if [ $? -eq 0 ]; then
                printf "\n${RESET}${txtbggrn}${BOLD}App $app uninstalled successfully.${RESET}${WHITE}${BOLD}\n"
            else
                printf "\n${RESET}${txtbgred}${BOLD}Error uninstalling app $app.${RESET}${WHITE}${BOLD}\n"
            fi
        fi
    done < "$list_file"
    
    printf "\n   ${RESET}${UNDERLINE}${BOLD}Press ENTER to return to Start${RESET}\n"
    read -r a
    bash bin/Appsrun.sh
}

uninstall_bixby_apps() {
    local bixby_list="$1"
    printf "\n\n${RESET}    ${BLUE}########## Uninstalling Bixby Apps ##########${RESET}\n\n"
    while IFS= read -r app || [ -n "$app" ]; do
        if [ -n "$app" ]; then
            printf "\n${BLUE}Are you sure to uninstall $app? (Y/n): "
            read -n 1 uninstall_choice
            case $uninstall_choice in
                [Yy])
                    pm uninstall -k --user 0 "$app"
                    if [ $? -eq 0 ]; then
                        printf "\n${RESET}${txtbggrn}${BOLD}App $app uninstalled successfully.${RESET}${WHITE}${BOLD}\n"
                    else
                        printf "\n${RESET}${txtbgred}${BOLD}Error uninstalling app $app.${RESET}${WHITE}${BOLD}\n"
                    fi
                    ;;
                [nN])
                    printf "\n${RED}Skipping $app.${RESET}\n"
                    ;;
                *)
                    printf "\n${RED}[!] Invalid choice, skipping $app.${RESET}\n"
                    ;;
            esac
        fi
    done < "$bixby_list"
}

start() {
    printf "\n%.0s" {1..100} ; clear
    printf "\n\n${RESET}    ${BLUE}########## Debloat Menu ##########${RESET}\n\n"
    printf "    ${BOLD_WHITE}Choose what to do?\n${RESET}
    1.  Uninstall from Enabled list
    2.  Uninstall from Disabled list
    3.  Uninstall from ${txtbgred}InfaDebloat list${RESET}${WHITE}
    4.  Uninstall Bixby packages
    5.  Uninstall Additions Debloat Packages
    ${MAGENTA}6.  Return back
    ${MAGENTA}7.  Return to start
    ${RED}8.  Exit"
    printf "\n\n${RESET}    ${BLUE}##################################${WHITE}
    ${BLUE}${BOLD}Enter your choice: "
    read -r choice

    case $choice in
        1)
            confirm_and_execute || return
            uninstall_from_list "$HOME/Debloat/enabled_list.txt"
            ;;
        2)
            confirm_and_execute || return
            uninstall_from_list "$HOME/Debloat/debloat_list.txt"
            ;;
        3)
            confirm_and_execute || return
            uninstall_from_list "/data/data/com.termux/files/home/infaScript/res/Infadebloat.txt"
            ;;
        4)
            confirm_and_execute || return
            uninstall_bixby_apps "/data/data/com.termux/files/home/infaScript/res/Bixby.txt"
            ;;
        5)
            confirm_and_execute || return
            bash bin/Appsrun.sh
            ;;
        6)
            confirm_and_execute || return
            uninstall_from_list "/data/data/com.termux/files/home/infaScript/res/Addition.txt"
            ;;
        7)
            confirm_and_execute || return
            printf "\n   ${RESET}${UNDERLINE}${BOLD}Press ENTER to return to Start${RESET}\n"
            read -r a
            exit 0
            ;;
        8)
           exit_a
           ;;
        *)
            printf "\n${RED}[!] Choose a valid option.${RESET}\n"
            read -r a 
            start
            ;;
    esac
}

start