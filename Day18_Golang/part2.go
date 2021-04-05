package main

import (
	"io/ioutil"
	"strings"
)

const INPUT_FILE = "input.txt"

// Count the number of neighbours lights that are on 
func neighboursCount(grid [][]bool, coord_x, coord_y int) int {
	total := 0
	for x := coord_x - 1; x <= coord_x + 1 && x < 100; x++ {
		for y := coord_y - 1; y <= coord_y + 1 && y < 100; y++ {
			if x >= 0 && y >= 0 && !(coord_x == x && coord_y == y) && grid[x][y] {
				total++
			}
		}
	}
	return total
}

// Init the grid
func gridInit() [][]bool {
	grid := make([][]bool, 100)
	for x := 0; x < 100; x++ {
		grid[x] = make([]bool, 100)
	}
	return grid
}

func main() {
  // Reading the input file
	input, err := ioutil.ReadFile(INPUT_FILE)
	if err != nil {
		panic(err)
	}

  // Creating the grid
	grid := gridInit()
	rows := strings.Split(string(input), "\n")

	for coord_y, row := range rows {
		for coord_x, state := range strings.Split(row, "") {
			grid[coord_x][coord_y] = state == "#"
		}
	}

	// Steps
	for i := 0; i < 100; i++ {
		newGrid := gridInit()

		for coord_x := 0; coord_x < 100; coord_x++ {
			for coord_y := 0; coord_y < 100; coord_y++ {
				neighbours_count := neighboursCount(grid, coord_x, coord_y)
				
				// If the light is on or off
				if grid[coord_x][coord_y] {
					newGrid[coord_x][coord_y] = neighbours_count == 2 || neighbours_count == 3
				} else {
					newGrid[coord_x][coord_y] = neighbours_count == 3
				}
		
		// The four corners always in the on state
        if (coord_x == 0 || coord_x == 99) && (coord_y == 0 || coord_y == 99) {
					newGrid[coord_x][coord_y] = true
				}
			}
		}
		grid = newGrid
	}

  // Solving the challenge
	result := 0
	for coord_x := 0; coord_x < 100; coord_x++ {
		for coord_y := 0; coord_y < 100; coord_y++ {
			if grid[coord_x][coord_y] {
				result++
			}
		}
	}
	println(result)
}