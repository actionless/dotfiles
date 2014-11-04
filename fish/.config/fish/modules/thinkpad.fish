
function tpd_tgl --description "toggle touchpad on/off"
	if test (synclient | grep TouchpadOff | sed -r "s/.*([0,1]).*/\1/") -eq 0
		synclient TouchpadOff=1
	else
		synclient TouchpadOff=0
	end
end

