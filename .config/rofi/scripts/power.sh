#!/bin/bash

choice="Spegni\nRiavvia\nSospendi\nBlocca\nEsci"

menu="$(echo -e $choice | rofi -dmenu -lines 5 -width 9 -padding 10 -scrollbar-width 0 -p Sessione)"
case $menu in
        Spegni)
                systemctl poweroff
                ;;
        Riavvia)
                systemctl reboot
                ;;
        Sospendi)
                systemctl suspend
                ;;
        Blocca)
                i3lock
                ;;
        Esci)
                killall bspwm
                ;;
esac
