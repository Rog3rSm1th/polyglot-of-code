#!/usr/bin/awk -f

# Match all lines
/.+/ {
	reindeer_name              = $1;
	speed[reindeer_name]       = int($4);
	fly[reindeer_name]         = int($7);
	rest[reindeer_name]        = int($14);
}

function get_reindeer_distance(reindeer_name, time, total_time, total_distance, iterations) {
	total_distance = speed[reindeer_name] * fly[reindeer_name];
	total_time = fly[reindeer_name] + rest[reindeer_name];

	iterations = int(time / total_time);
	iteration = time % total_time;

	if (iteration >= fly[reindeer_name])
		return total_distance * iterations + total_distance;
	else
		return total_distance * iterations + speed[reindeer_name] * iteration;
}

END {
	# Puzzle input
	SECONDS = 2503; 

	for (reindeer_name in speed) {
		reindeer_distance = get_reindeer_distance(reindeer_name, SECONDS);
		result = (reindeer_distance < result ? result : reindeer_distance);
	}
	print result;
}