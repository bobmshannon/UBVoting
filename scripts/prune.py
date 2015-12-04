import os

# CSV file containing raw data points
CSV_FILE = "[25, 44] - Presidential Election Voting Turnout By Age 1964 thru 2014.csv"

file = open(CSV_FILE)

data = dict()

"""
Print y-values of each point as a comma delimited list.
"""
def print_y_values():
	y_values = ""

	for key in data:
		y_value = round(data[key][0], 2)
		y_values = y_values + str(y_value) + ","

	print y_values[0:len(y_values)-1]

for line in file:
	# Get data point
	line = line.strip()
	point = line.split(',')

	x = int(point[0])
	y = float(point[1])

	# Store data point in dict
	if x in data.keys():
		data[x].append(y)
	else:
		data[x] = [y]

	# Average duplicate data points and update dict
	for key in data:
		totalsum = sum(data[key])
		numpoints = len(data[key])
		del data[key][:]
		data[key].append(totalsum / numpoints)

print_y_values()
