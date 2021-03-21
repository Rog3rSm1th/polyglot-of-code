import tables
import algorithm
import strutils
import sequtils

var
    distances_table = initTable[(string, string), int]()
    cities = newSeq[string]()

# Add a distance to the array
proc add_distance(input: string) = 
  let tokens      = input.split(" ")

  let source      = tokens[0]
  let destination = tokens[2]
  let distance    = parseInt tokens[4]

  if source notin cities: cities.add source
  if destination notin cities: cities.add destination
  distances_table[(source, destination)] = distance
  distances_table[(destination, source)] = distance

proc solve(file: File): int =
  result = 100000

  # Create an array with the different distances
  for line in lines file:
    add_distance(line)

  # Find the shortest route
  sort(cities, cmp)
  while nextPermutation cities:
    var sum = 0
    for i in 0 ..< cities.high:
      sum += distances_table[(cities[i], cities[i+1])]
    # if we find a shortest path 
    if sum < result:
      result = sum

let result = solve(open("input.txt"))
echo result