#!/usr/bin/awk -f

/.+/ {
	reindeer_name                 = $1;
	speed[reindeer_name]          = int($4);
	fly[reindeer_name]            = int($7);
	rest[reindeer_name]           = int($14);
	# no special representation for the concepts of “true” and “false in awk
	flying[reindeer_name]         = 1;
	remaining_time[reindeer_name] = fly[reindeer_name];
	distance[reindeer_name]       = 0;
	points[reindeer_name]         = 0;
}

function action(reindeer_name, cycle_sec, cycle_distance, ncycle) {
	distance[reindeer_name] += flying[reindeer_name] * speed[reindeer_name];
	new_time = --remaining_time[reindeer_name];

	if (!new_time) {
		flying[reindeer_name] = !flying[reindeer_name];
		remaining_time[reindeer_name] = (flying[reindeer_name] ? fly[reindeer_name] : rest[reindeer_name]);
	}
}

END {
	# Puzzle input
	SECONDS = 2503;

	for (time = 1; time <= SECONDS; time++) {
		for (reindeer_name in speed)
			action(reindeer_name);
		
		for (reindeer_name in speed)
			reindeer_distance = distance[reindeer_name] < reindeer_distance ?  reindeer_distance : distance[reindeer_name];
		
		# Add a point
		for (reindeer_name in speed) {
			if (distance[reindeer_name] == reindeer_distance)
				points[reindeer_name]++;
		}
	}
	
	for (reindeer_name in speed) {
		result = points[reindeer_name] < result ? result : points[reindeer_name];
	}

	print result;
}