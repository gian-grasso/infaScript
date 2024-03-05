#!/bin/bash
Infadebloatrun() {
    printf "${RESET}${RED}${BOLD}Are u sure to uninstall from InfaDebloat list? (1=YES ; 2=NO)${BLUE}${BOLD}
    "
    read -r choice
    case $choice in
        1)
                while IFS= read -r app || [ -n "$app" ]; do
                if [ -n "$app" ]; then
                    pm uninstall -k --user 0 "$app"
                    if [ $? -eq 0 ]; then
                        printf "App $app disabled successfully."
                    else
                        printf "Error disabling app $app."
                    fi
                fi
                done < "Infadebloat.txt"
            printf "
            ${RESET}${RED}${txtbgblu}${BOLD}InfaDebloat list apps uninstalled 
            ${RESET}${txtinv}${BOLD}press ENTER to return back..${RESET}"
            read -r a
            sh bin/Appsrun.sh
            ;;
        2)
            start
            ;;
        *)
            printf "${RESET}${txtinv}${BOLD}Invalid choice. Press ENTER to continue...${RESET}"
            read -r a
            Infadebloatrun
            ;;
    esac
}
debloateren() {
    printf "${RESET}${RED}${BOLD}Are u sure to uninstall from Enabled list? (1=YES ; 2=NO)${BLUE}${BOLD}
    "
    read -r choice
    case $choice in
        1)
                while IFS= read -r app || [ -n "$app" ]; do
                if [ -n "$app" ]; then
                    pm uninstall -k --user 0 "$app"
                    if [ $? -eq 0 ]; then
                        printf "App $app disabled successfully."
                    else
                        printf "Error disabling app $app."
                    fi
                fi
                done < "$HOME/enabled_list.txt"
            printf "
            ${RESET}${RED}${txtbgblu}${BOLD}Enabled list apps uninstalled 
            ${RESET}${txtinv}${BOLD}press ENTER to return back..${RESET}"
            read -r a
            sh bin/Appsrun.sh
}
debloaterdeb() {
        printf "${RESET}${RED}${BOLD}Are u sure to uninstall from Debloat list? (1=YES ; 2=NO)${BLUE}${BOLD}
    "
    read -r choice
    case $choice in
        1)
                while IFS= read -r app || [ -n "$app" ]; do
                if [ -n "$app" ]; then
                    pm uninstall -k --user 0 "$app"
                    if [ $? -eq 0 ]; then
                        printf "App $app disabled successfully."
                    else
                        printf "Error disabling app $app."
                    fi
                fi
                done < "$HOME/debloat_list.txt"
            printf "
            ${RESET}${RED}${txtbgblu}${BOLD}Debloat list apps uninstalled 
            ${RESET}${txtinv}${BOLD}press ENTER to return back..${RESET}"
            read -r a
            sh bin/Appsrun.sh
}


start(){
clear
home_directory=$HOME
debloat_list="$home_directory/debloat_list.txt"
enable_list="$home_directory/enabled_list.txt"

# Check if debloat_list.txt exists, otherwise create it
if [ ! -f "$debloat_list" ]; then
    touch "$debloat_list"
    printf "
    ${RESET}${txtbgblu}${BOLD}debloat_list.txt created in $home_directory.${RESET}"
    chmod 0755 $home_directory/debloat_list.txt
fi
if [ ! -f "$enable_list" ]; then
    touch "$enable_list"
    printf "
    ${RESET}${txtbgblu}${BOLD}enabled_list.txt created in $home_directory.${RESET}"
    $home_directory/enabled_list.txt
    chmod 0755 $home_directory/debloat_list.txt
fi
printf "
    ${RESET}${txtbgrst}${BLUE}${BOLD}########## DEBLOATER ##########${WHITE}
    ${RESET}${GREEN}${BOLD}Choose an option: ${WHITE}${BOLD}
    1.  Uninstall from Enabled list
    2.  Uninstall from Disabled list
    3.  Uninstall from ${txtbgred}${BOLD}InfaDebloat list${RESET}${WHITE}${BOLD}
    ${MAGENTA}${BOLD}4.  Return back
    ${MAGENTA}${BOLD}5.  Return to Start
    ${RED}${BOLD}6.  Exit
    ${RESET}${txtbgrst}${BLUE}${BOLD}###############################${WHITE}
    ${BLUE}${BOLD}Enter your choice: "
    read -r choice

    case $choice in
        1)
            debloateren
            ;;
        2)
            debloaterdeb
            ;;
        3)
            Infadebloatrun
            ;;
        4)
            sh bin/Appsrun.sh
            ;;
        6)
            exit 0
            ;;
        6)
            printf "
            ${RESET}${RED}${BOLD}Press ENTER to exit"
            read -r a
            clear
            pkill -f InfaScript.sh
            ;;
        *)
            printf "${RESET}${txtinv}${BOLD}Invalid choice. Press ENTER to continue...${RESET}"
            read -r a
            remove_apps
            ;;
    esac
}
start





