#!/bin/bash

echo "  ooooooo     ooooooo                  o88                           "
echo "o88     888 o888  o888o  oooo  o  oooo oooo  oo oooooo    oooooooo8  "
echo "      o888  888  8  888   888 888 888   888   888   888  888ooooooo  "
echo "   o888   o 888o8  o888    888888888    888   888   888          888 "
echo "o8888oooo88   88ooo88       88   88    o888o o888o o888o 88oooooo88  "

game_loop () {
    current_value=0
    read -p "Enter user name: " usr
    while true ; do
        while true ; do
            echo -e "\nThe current value is: ${current_value}\n"
            read -p "It's your turn ${usr}: " usr_input
            if [[ $usr_input -eq $(($current_value + 1)) ]] || [[ $usr_input -eq $(($current_value + 2)) ]] ; then
                break
            elif [[ $usr_input -gt 20 ]] ; then
                echo "Error: number too high"
            else
                echo "Error: invalid user input"
            fi
        done
        current_value=$usr_input

        if [[ $current_value -eq 20 ]] ; then
            echo "Congratulations, you won!"
            exit 0
        fi

        if [[ $current_value -gt 17 ]] ; then
            current_value=20
        else
            current_value=$(($current_value + $[RANDOM%2]+1))
        fi
        echo "Computer chooses: ${current_value}"

        if [[ $current_value -eq 20 ]] ; then
            echo "The computer won, better luck next time!"
            exit 1
        fi
    done
}
game_loop  