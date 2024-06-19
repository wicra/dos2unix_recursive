#!/bin/bash

# Vérifier si dos2unix est installé
if ! command -v dos2unix &> /dev/null; then
    echo "dos2unix n'est pas installé. Installation en cours..."
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        sudo apt update
        sudo apt install dos2unix -y
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        brew install dos2unix
    else
        echo "Système d'exploitation non pris en charge pour l'installation automatique de dos2unix."
        exit 1
    fi
fi

# Vérifier le nombre de paramètres
if [ $# -ne 1 ]; then
    echo "Usage: $0 <chemin_dossier>"
    exit 1
fi

# Vérifier si le chemin spécifié est un répertoire valide
directory="$1"
if [ ! -d "$directory" ]; then
    echo "Erreur: '$directory' n'est pas un répertoire valide."
    exit 1
fi

# Fonction récursive pour convertir en dos2unix
convert_recursive() {
    local dir="$1"
    find "$dir" -type f -exec dos2unix {} \;
    for d in "$dir"/*; do
        if [ -d "$d" ]; then
            convert_recursive "$d"
        fi
    done
}

# Appeler la fonction pour convertir récursivement
convert_recursive "$directory"

echo "Conversion dos2unix terminée pour '$directory'."
