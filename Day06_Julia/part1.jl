# Grid size
const WIDTH  = 1000
const HEIGHT = 1000

struct Instruction
    instruction::String
    start_x    ::Int16
    end_x      ::Int16
    start_y    ::Int16
    end_y      ::Int16
end

# Executes an instruction and returns the grid
function execute(ins::Instruction, grid) 
    # toggle 
    if ins.instruction == "toggle"
        grid[ins.start_x:ins.start_y,ins.end_x:ins.end_y] = .!grid[ins.start_x:ins.start_y,ins.end_x:ins.end_y]
    # turn off
    elseif ins.instruction == "turn off"
        grid[ins.start_x:ins.start_y,ins.end_x:ins.end_y] .= 0
    # turn on
    else
         grid[ins.start_x:ins.start_y,ins.end_x:ins.end_y] .= 1
    end
    
    return grid
end

function solve(input_file)

    # 1000 * 1000 binary grid
    grid = BitArray(zeros(WIDTH, HEIGHT))

    lines = readlines(input_file)
    for line in lines
        instruction_regexp = r"(turn on|toggle|turn off) ([0-9]+),([0-9]+) through ([0-9]+),([0-9]+)"
        tokens = match(instruction_regexp, line)
        instruction = Instruction(tokens[1], 
                                  parse(Int16, tokens[2]), 
                                  parse(Int16, tokens[3]), 
                                  parse(Int16, tokens[4]), 
                                  parse(Int16, tokens[5])
        )
        
        execute(instruction, grid)
    end

    result = sum(grid)
    return result
end

println(solve("input.txt"))