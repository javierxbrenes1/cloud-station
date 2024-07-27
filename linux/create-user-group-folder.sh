#!/bin/bash

# Part 1: Create user, group, and directory

read -p "Provide user name: " user_name
read -p "Provide group name: " group_name
read -p "Provide directory: " new_directory

# Check if user, group, or directory already exists
if id -u "$user_name" >/dev/null 2>&1; then
    echo "User '$user_name' already exists. Cannot proceed."
    exit 1
fi

if grep -q "^$group_name:" /etc/group; then
    echo "Group '$group_name' already exists. Cannot proceed."
    exit 2
fi

if [ -d "$new_directory" ]; then
    echo "Directory '$new_directory' already exists. Cannot proceed."
    exit 3
fi

# Create user and set password
useradd $user_name
passwd $user_name

# Create group and add user to group
groupadd $group_name
usermod -aG $group_name $user_name

# Create directory and set ownership and permissions
mkdir $new_directory
chown $user_name:$group_name $new_directory

echo "User, group, and directory created successfully."
exit 0
