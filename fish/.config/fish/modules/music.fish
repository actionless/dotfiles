# Calibration:
#
# PPM:
# Alignment level (0 dBu) and Permitted Maximum Level (+8 dBu)
# correspond to scale marks '4' and '6' respectively. 
#

set -l m50 "ATH-M50xBT    "
set -l bose "Bose AE2 SoundLink"
set -l avantree "Avantree C81 Analog Stereo"
set -l LEFT "monitor_FL"
set -l RIGHT "monitor_FR"
set -l PPM_GAIN 0
#set -l VU_GAIN 14
#set -l VU_GAIN 20
set -l VU_GAIN 0


abbr meter_bose_ppm "meterbridge     '$bose:$LEFT'     '$bose:$RIGHT' -t ppm -r $PPM_GAIN"
abbr meter_bose_vu  "meterbridge     '$bose:$LEFT'     '$bose:$RIGHT' -t vu -r +$VU_GAIN"
abbr meter_bose_jf  "meterbridge     '$bose:$LEFT'     '$bose:$RIGHT' -t jf"
abbr meter_bose_ebu "ebumeter    -cl '$bose:$LEFT' -cr '$bose:$RIGHT'"

#abbr meter_bose_ppm-5db "meterbridge '$bose:$LEFT'     '$bose:$RIGHT' -t ppm -r (math $PPM_GAIN - 5)"
#abbr meter_bose_vu-5db  "meterbridge '$bose:$LEFT'     '$bose:$RIGHT' -t vu -r +(math $VU_GAIN - 5)"


abbr meter_m50_ppm "meterbridge  '$m50:$LEFT'     '$m50:$RIGHT' -t ppm -r $PPM_GAIN"
abbr meter_m50_vu  "meterbridge  '$m50:$LEFT'     '$m50:$RIGHT' -t vu -r +$VU_GAIN"
abbr meter_m50_jf  "meterbridge  '$m50:$LEFT'     '$m50:$RIGHT' -t jf"
abbr meter_m50_ebu "ebumeter -cl '$m50:$LEFT' -cr '$m50:$RIGHT'"

#abbr meter_m50_ppm-5db "meterbridge '$m50:$LEFT' '$m50:$RIGHT' -t ppm -r (math $PPM_GAIN - 5)"
#abbr meter_m50_vu-5db  "meterbridge '$m50:$LEFT' '$m50:$RIGHT' -t vu -r +(math $VU_GAIN - 5)"


abbr meter_avan_ppm "meterbridge  '$avantree:$LEFT'     '$avantree:$RIGHT' -t ppm -r $PPM_GAIN"
abbr meter_avan_vu  "meterbridge  '$avantree:$LEFT'     '$avantree:$RIGHT' -t vu -r +$VU_GAIN"
abbr meter_avan_jf  "meterbridge  '$avantree:$LEFT'     '$avantree:$RIGHT' -t jf"
abbr meter_avan_ebu "ebumeter -cl '$avantree:$LEFT' -cr '$avantree:$RIGHT'"
