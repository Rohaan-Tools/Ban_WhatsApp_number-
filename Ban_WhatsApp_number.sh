#!/bin/bash

# ASCII art - WhatsApp Blocker 🚫 in Red
echo -e "\033[31m"
echo "============================================"
echo "    ██    ██  ██████╗ ███████╗██╗  ██╗    "
echo "    ██    ██ ██╔═══██╗██╔════╝██║ ██╔╝    "
echo "    ██    ██ ██║   ██║███████╗█████╔╝     "
echo "    ██    ██ ██║   ██║╚════██║██╔═██╗     "
echo "    ████████ ██║   ██║███████║██║  ██╗    "
echo "    ╚══════╝ ╚═╝   ╚═╝╚══════╝╚═╝  ╚═╝    "
echo "--------------------------------------------"
echo "       W H A T S A P P   B L O C K E R      "
echo "                 🚫 🚫 🚫                   "
echo "--------------------------------------------"
echo "       Coded by Rohan and Pop Smoke         "
echo "============================================"
echo -e "\033[0m"
echo ""

# Replace '1234567890' with the WhatsApp number you want to ban
NUMBER_TO_BAN='1234567890'

# Check if termux-contact-add exists
if ! command -v termux-contact-add &> /dev/null; then
    echo "termux-contact-add not found. Add the number manually to your contacts."
else
    # Add the number to contacts
    CONTACT_NAME='Blocked Contact'
    termux-contact-add -n "$CONTACT_NAME" -p "$NUMBER_TO_BAN"
    echo "Number $NUMBER_TO_BAN has been added to contacts as '$CONTACT_NAME'."
fi

# Check and block the number
CONTACTS=$(termux-contact-list)

if echo "$CONTACTS" | grep -q "$NUMBER_TO_BAN"; then
    CONTACT_ID=$(echo "$CONTACTS" | grep "$NUMBER_TO_BAN" | awk '{print $1}')
    termux-sms-block "$CONTACT_ID"
    echo "Number $NUMBER_TO_BAN has been blocked."
else
    echo "Number $NUMBER_TO_BAN not found in contacts."
fi
