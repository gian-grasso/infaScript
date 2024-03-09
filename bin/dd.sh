#!/bin/bash

ddbackup() {
clear
printf "\n${RESET}${txtbgrst}${BLUE}${BOLD}########## Partitions Backup ##########${WHITE}${BOLD}
1.  Boot
2.  Dtb
3.  Dtbo
4.  Efs
5.  Product
6.  Recovery
7.  System
8.  Vbmeta
9.  Vendor
${MAGENTA}${BOLD}10. Return to Start
${RED}${BOLD}11. Exit
${RESET}${txtbgrst}${BLUE}${BOLD}#######################################${WHITE}${BOLD}
Enter your choice: \n"
read -r choice
    case $choice in
        1)
            printf "\n${RESET}${txtbgblu}${BOLD}Which name do u want to give?${RESET}\n"
            read -r backup_name
            printf "\n${RESET}${txtbgred}${BOLD}Backuping Boot..${RESET}\n"
            dd if=/$partition/boot of=/sdcard/$backup_name.img
            printf "\n${txtbgred}${BOLD}$backup_name.img${RESET} ${txtbgblu}${BOLD}created in /sdcard/${RESET}\n
            \n${txtinv}${BOLD}Press ENTER to return to the start${RESET}\n"
            read -r a
            ddbackup
            ;;
        2)
            printf "\n${RESET}${txtbgblu}${BOLD}Which name do u want to give?${RESET}\n"
            read -r backup_name
            printf "\n${RESET}${txtbgred}${BOLD}Backuping Dtb..${RESET}\n"
            dd if=$partition/dtb of=/sdcard/$backup_name.img
            printf "\n${txtbgred}${BOLD}$backup_name.img${RESET} ${txtbgblu}${BOLD}created in /sdcard/${RESET}\n
            \n${txtinv}${BOLD}Press ENTER to return to the start${RESET}\n"
            read -r a
            ddbackup
            ;;
        3)
            printf "\n${RESET}${txtbgblu}${BOLD}Which name do u want to give?${RESET}\n"
            read -r backup_name
            printf "\n${RESET}${txtbgred}${BOLD}Backuping Dtbo..${RESET}\n"
            dd if=$partition/dtbo of=/sdcard/$backup_name.img
            printf "\n${txtbgred}${BOLD}$backup_name.img${RESET} ${txtbgblu}${BOLD}created in /sdcard/${RESET}\n
            \n${txtinv}${BOLD}Press ENTER to return to the start${RESET}\n"
            read -r a
            ddbackup
            ;;
        4)
            printf "\n${RESET}${txtbgblu}${BOLD}Which name do u want to give?${RESET}\n"
            read -r backup_name
            printf "\n${RESET}${txtbgred}${BOLD}Backuping Efs..${RESET}\n"
            dd if=$partition/efs of=/sdcard/$backup_name.img
            printf "\n${txtbgred}${BOLD}$backup_name.img${RESET} ${txtbgblu}${BOLD}created in /sdcard/${RESET}\n
            \n${txtinv}${BOLD}Press ENTER to return to the start${RESET}\n"
            read -r a
            ddbackup
            ;;
        5)
            printf "\n${RESET}${txtbgblu}${BOLD}Which name do u want to give?${RESET}\n"
            read -r backup_name
            printf "
            ${RESET}${txtbgred}${BOLD}Backuping Product..${RESET}
            "
            dd if=$partition/product of=/sdcard/$backup_name.img
            printf "
            ${txtbgred}${BOLD}$backup_name.img${RESET} ${txtbgblu}${BOLD}created in /sdcard/${RESET}
            ${txtinv}${BOLD}Press ENTER to return to the start${RESET}"
            read -r a
            ddbackup
            ;;
        6)
            printf "
            ${RESET}${txtbgblu}${BOLD}Which name do u want to give?${RESET}
            "
            read -r backup_name
            printf "
            ${RESET}${txtbgred}${BOLD}Backuping Recovery..${RESET}
            "
            dd if=$partition/recovery of=/sdcard/$backup_name.img
            printf "
            ${txtbgred}${BOLD}$backup_name.img${RESET} ${txtbgblu}${BOLD}created in /sdcard/${RESET}
            ${txtinv}${BOLD}Press ENTER to return to the start${RESET}"
            read -r a
            ddbackup
            ;;
        7)
            printf "\n${RESET}${txtbgblu}${BOLD}Which name do u want to give?${RESET}\n"
            read -r backup_name
            printf "\n${RESET}${txtbgred}${BOLD}Backuping System..${RESET}\n"
            dd if=$partition/system of=/sdcard/$backup_name.img
            printf "\n${txtbgred}${BOLD}$backup_name.img${RESET} ${txtbgblu}${BOLD}created in /sdcard/${RESET}\n
            \n${txtinv}${BOLD}Press ENTER to return to the start${RESET}\n"
            read -r a
            ddbackup
            ;;
        8)
            printf "\n${RESET}${txtbgblu}${BOLD}Which name do u want to give?${RESET}\n"
            read -r backup_name
            printf "\n${RESET}${txtbgred}${BOLD}Backuping Vbmeta..${RESET}\n"
            dd if=$partition/vbmeta of=/sdcard/$backup_name.img
            printf "\n${txtbgblu}${BOLD}$backup_name.img${RESET} ${txtbgblu}${BOLD}created in /sdcard/${RESET}\n
            \n${txtinv}${BOLD}Press ENTER to return to the start${RESET}\n"
            read -r a
            ddbackup
            ;;
        9)
            printf "\n${RESET}${txtbgblu}${BOLD}Which name do u want to give?${RESET}\n"
            read -r backup_name
            printf "\n${RESET}${txtbgred}${BOLD}Backuping Vendor..${RESET}\n"
            dd if=$partition/vendor of=/sdcard/$backup_name.img
            printf "\n${txtbgred}${BOLD}$backup_name.img${txtbgblu}${RESET} ${BOLD}created in /sdcard/${RESET}\n
            \n${txtinv}${BOLD}Press ENTER to return to the start${RESET}\n"
            read -r a
            ddbackup
            ;;
        10)
            printf "\n${RESET}${RED}${BOLD}Press ENTER to exit${RESET}\n"
            read -r a
            clear
            exit 0
            ;;
        11)
            pkill -f InfaScript.sh
            ;;
        *)
            printf "${RESET}${txtinv}${BOLD}Choose a valid option, press ENTER to continue...${RESET}"
            ddbackup
            ;;
    esac
}
partitioncreate() {
file="$HOME/partitions.txt"

if [ -e "$file" ]; then
    partition=$(head -n 1 "$file")
else
    printf "\n${txtbgblu}${BOLD}There is no ${txtbgred}${BOLD}$file${txtbgblu}${BOLD} file.\n${RESET}
    \n${txtbgblu}${BOLD}Write the partition directory\n${RESET}"
    read -r input_partition
    echo "$input_partition" > "$file"
    partition="$input_partition"
fi
partitioncheck
}
partitioncheck() {
clear
printf "\n${txtbgblu}${BOLD}The \n$file
contains ${txtbgred}${BOLD}$partition${txtbgblu}${BOLD}.\nIs it the correct directory?(1=Yes, 2=No)\n${RESET}"
read -r answ
case $answ in
    1)
        ddbackup
        ;;
    2)
        file="$HOME/partitions.txt"
        printf "\n${txtbgblu}${BOLD}Write the partition directory\n${RESET}"
        read -r input_partition
        echo "$input_partition" > "$file"
        partition="$input_partition"
        ddbackup
        ;;
    *)
        printf "\n${RESET}${txtinv}${BOLD}Choose a valid option, press ENTER to continue...${RESET}
        "
        read -r a
        clear
        partitioncheck
        ;;
esac
}
checks() {
    if su -c 'true' >/dev/null 2>&1; then
        echo -e "\n${GREEN}${BOLD}[i] Root access found. Starting script...${RESET}\n"
        sleep 2
        clear
        partitioncreate
    else
        echo -e "\n${RED}${BOLD}[i] Root access not found. U cannot execute this command${RESET}\n"
        sleep 2
        clear
        exit 1       
    fi
}
checks