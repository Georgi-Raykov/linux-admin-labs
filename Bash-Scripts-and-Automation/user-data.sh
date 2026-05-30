#!/bin/bash

read -p "First Name: " first_name
read -p "Last Name: " last_name
read -p "Place of birth: " birth_place

echo "${first_name};${last_name};${birth_place}" >> /tmp/user-data.dat
