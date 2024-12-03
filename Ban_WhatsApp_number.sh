#!/bin/bash

# Replace '1234567890' with the WhatsApp number you want to ban
NUMBER_TO_BAN='1234567890'

# Use termux-contact-list to get a list of all contacts
CONTACTS=$(termux-contact-list)

# Check if the number to ban is in the contacts
if echo "$CONTACTS" | grep -q "$NUMBER_TO_BAN"; then
    # Get the contact ID of the number to ban
    CONTACT_ID=$(echo "$CONTACTS" | grep "$NUMBER_TO_BAN" | awk '{print $1}')
    
    # Use termux-sms-block to block the number
    termux-sms-block "$CONTACT_ID"
    echo "Number $NUMBER_TO_BAN has been blocked."
else
    echo "Number $NUMBER_TO_BAN not found in contacts."
fi