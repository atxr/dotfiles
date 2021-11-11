#!/bin/sh
#touch /tmp/bar_out_spectrwm

date=$( date +"%H:%M %z   |  %^a %e/%m %^b")
bat=$( acpi -b | sed -r 's/.*: (...).*,( .*),.*/Bat: \1,\2/')
#temp=$( acpi -t | sed -r 's/.*, (.*) d.*/CPU: \1°C/' )
#vcore=$(sensors | sed -n 's/\(Vcore\).* \(.* .*V\) (.*/\1: \2/p')
vcore=$(sensors | sed -r -n 's/(Vcore).* (.* .*V)$/\1: \2/p')
icore=$(sensors | sed -n 's/\(Icore\).* \(.* .*A\)/\1: \2/p')
temp=$(sensors | sed -n 's/\(Tdie\).*+\(.*\)C/\1: \2/p')
nvme_temp=$(sensors | sed -n 's/Comp.*+\(.*\)C.*(.*/NVME: \1/p')
entropy=$( printf 'Entropy: %s' $(cat /proc/sys/kernel/random/entropy_avail) )
#bar_out=$( cat /tmp/bar_out_spectrwm | tr '\n' '   ' )
#who=$( who -q | grep -v \# | sed 's/\(.*\)/Users: \1/' )
#hdd=$( df / -h | sed -n 's/.*G.*G.* \(.*G\).*/HDD: \1 free/p' )
#hdd_bat=$( df /media/bat-pc/home -h | sed -n 's/.*G.*G.* \(.*G\).*/bat-pc: \1 free/p' )
mem=$( free -h | sed -r -n 's/Mem.*[GM].* (.*[GM])(.*[GM]){2}.* (.*[GM]).*[GM]./Mem: \1 used, \3 cache/p' ) #or awk 'NR==2{print "Mem: " $3 " used", $6 " cache"}' but awk is lame
mpvd=$( sed /tmp/mpv_daemon.log -n -r -e 's/.*(Title: |Playing:(.*\/))(.*)/Playing: \3/p' | sed -e '$!d' )
#ifstat=$(ifstat -a -T 0.1 1 | tee | sed -r -n 's/.*\s([0-9]*\.[0-9]*)\s*(.*\..*)/Net: \1↓ \2↑/p')
#ifstat=$(ifstat -a -T 0.1 1 | tee | sed -r -n 's/.*\s(....)\..*(....)\.[0-9]*/net: \1↓ \2↑/p' ) #constant width

#printf "%s    %s    %s\n"  "$temp" "$mem" "$mpvd"
#printf "%s    %s    %s     %s  %s\n"  "$ifstat" "$temp" "$mem" "$mpvd"
#printf "%s    %s      %s\n"  "$temp" "$mem" "$mpvd"
#printf "%s    %s      %s    %s\n"  "$temp" "$bat" "$mem" "$mpvd"
printf "%s     %s     %s    %s    %s    %s    %s    %s\n" "$bat" "$entropy"  "$temp" "$vcore" "$icore" "$nvme_temp" "$mem" "$mpvd"
 





sleep 1
exec "$0" #relaunch itself, thanks simon
