# Verifica se l'eseguibile 'ls' è disponibile
clear
printf "\n${RESET}${txtbgrst}${BLUE}${BOLD}########## Partitions Backup ##########${WHITE}${BOLD}"
if ! command -v ls &> /dev/null; then
    printf "The 'ls' command is not available. Make sure it is installed."
    exit 1
fi

# Lista di possibili percorsi delle partizioni Android
possible_partitions=("/dev/block/by-name/" "/dev/block/sdcard" "/dev/block/by-num/")

android_partitions=()

# Cerca le partizioni Android in ciascun possibile percorso
for path in "${possible_partitions[@]}"; do
    partitions=$(ls "$path" 2>/dev/null)
    if [ $? -eq 0 ]; then
        android_partitions+=("$path")
        printf "Android partitions found in: $path"
        break
    fi
done

# Se nessuna partizione è stata trovata, segnala un errore
if [ ${#android_partitions[@]} -eq 0 ]; then
    printf "Unable to find Android partitions automatically. Check manually."
    exit 1
fi

# Chiedi all'utente di selezionare una partizione
printf "Choose a partition:"
select partition in $partitions; do
    if [ -n "$partition" ]; then
        break
    else
        printf "Choose a valid answer."
    fi
done

# Chiedi all'utente di specificare un nome per il backup
printf "\nChoose the backup name"
read -r backup_name

# Esegui il backup con 'dd'
backup_path="/sdcard/$backup_name.img"
printf "Saving the backup $partition in $backup_path..."
dd if="$android_partitions/$partition" of="$backup_path" bs=4096

if [ $? -eq 0 ]; then
    printf "Backup completed successfully. The file is saved in $backup_path"
else
    printf "An error occurred during backup."
    exit 1
fi