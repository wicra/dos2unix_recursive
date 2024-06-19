# Script de Conversion récursive en dos2unix

Ce script Bash permet de convertir récursivement tous les fichiers d'un dossier (et de ses sous-dossiers) au format Unix (LF) en utilisant `dos2unix`. Il vérifie d'abord si `dos2unix` est installé et l'installe automatiquement si nécessaire.

## Prérequis

- Système d'exploitation Linux ou macOS
- Accès administrateur pour installer des paquets (si nécessaire)

## Installation de dos2unix

Si `dos2unix` n'est pas déjà installé sur votre système, le script tentera de l'installer automatiquement :

- Pour Linux (Debian/Ubuntu), utilisez :
sudo apt update
sudo apt install dos2unix -y

- Pour macOS, utilisez Homebrew :
brew install dos2unix

## Utilisation

1. Assurez-vous que le script est exécutable :
chmod +x convert_to_unix.sh

2. Exécutez le script en spécifiant le chemin du dossier que vous souhaitez convertir :
./convert_to_unix.sh <chemin_dossier>

Remplacez `<chemin_dossier>` par le chemin absolu ou relatif du dossier que vous souhaitez convertir.

3. Le script convertira tous les fichiers de ce dossier (et de ses sous-dossiers) au format Unix.

## Exemple

Pour convertir tous les fichiers `.php` d'un dossier appelé `mon_projet` situé dans le répertoire courant :

```bash
./convert_to_unix.sh mon_projet