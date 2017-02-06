i3 reload
killall i3bar
for c in $(i3-msg -t get_bar_config | python -c \
	'import json,sys;print("\n".join(json.load(sys.stdin)))'); do \
	(i3bar --bar_id=$c >i3bar.$c.log 2>&1) & \
done;
