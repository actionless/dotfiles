#!/usr/bin/env -S python3 -u

total_width = 3840 + 1920
total_height = 2160
horizontal_offset = 3840
vertical_offset = 1080
touch_area_width = 1920
touch_area_height = 1080

# https://wiki.archlinux.org/title/Calibrating_Touchscreen

# The matrix is

# [ c0 0  c1 ]
# [ 0  c2 c3 ]
# [ 0  0  1  ]

touch_area_x_offset = horizontal_offset
touch_area_y_offset = vertical_offset

c0 = touch_area_width / total_width
c2 = touch_area_height / total_height
c1 = touch_area_x_offset / total_width
c3 = touch_area_y_offset / total_height

# which is represented as a row-by-row array:

# c0 0 c1 0 c2 c3 0 0 1

print(
    r"$ for id in"
    r" (xinput list | grep 'wch.cn TouchScreen' | sed -E 's/.*id=([0-9]*).*/\1/g')"
    r" ;"
    r" xinput set-prop $id --type=float 'Coordinate Transformation Matrix'"
    fr" {c0} 0 {c1} 0 {c2} {c3} 0 0 1"
    r" ;"
    r" end"
)
