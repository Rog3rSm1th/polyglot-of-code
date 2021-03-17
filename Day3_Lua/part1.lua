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
x = 500
y = 500

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

-- Mark the visited houses
function presents_distribution()
    grid[x][y] = 1
    local file = read_file("input.txt");

    for c in file:gmatch"." do
        delta = deltas[c]
        delta_x = delta[1]
        delta_y = delta[2]
        x = x + delta_x
        y = y + delta_y
        grid[x][y] = 1
    end
end

-- Count the marked houses
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
presents_distribution()
-- Result
print(count_houses())
