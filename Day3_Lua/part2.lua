local open = io.open

local function read_file(path)
    local file = open(path, "rb") 
    if not file then return nil end
    local content = file:read "*a"
    file:close()
    return content
end

deltas = {}
deltas['^'] = {0,  1}
deltas['v'] = {0, -1}
deltas['>'] = {1,  0}
deltas['<'] = {-1, 0}

-- Starting position
santa_x = 500
santa_y = 500

robot_santa_x = 500
robot_santa_y = 500

-- Create a 1000 x 1000 array
function create_grid()
    grid = {}
    for i = 1, 1000 do
        grid[i] = {}

        for j = 1, 1000 do
            grid[i][j] = 0
        end
    end
end

file = read_file("input.txt");

-- Mark the houses visited by Santa
function santa_distribution()
    grid[santa_x][santa_y] = 1

    for i = 1, #file, 2 do
    local c = file:sub(i,i)
        delta = deltas[c]
        delta_x = delta[1]
        delta_y = delta[2]
        santa_x = santa_x + delta_x
        santa_y = santa_y + delta_y
        grid[santa_x][santa_y] = 1
    end
end

-- Mark the houses visited by Robot-Santa
function robot_santa_distribution()
    local file = read_file("input.txt");

    for i = 2, #file, 2 do
    local c = file:sub(i,i)
        delta = deltas[c]
        delta_x = delta[1]
        delta_y = delta[2]
        robot_santa_x = robot_santa_x + delta_x
        robot_santa_y = robot_santa_y + delta_y
        grid[robot_santa_x][robot_santa_y] = 1
    end
end

-- Count the Marked houses
function count_houses()
    local count = 0

    for i = 1, 1000 do
        for j = 1, 1000 do
            if grid[i][j] ~= 0 then
                count = count + 1
            end
        end
    end
    return count
end

create_grid()
santa_distribution()
robot_santa_distribution()
-- Result
print(count_houses())