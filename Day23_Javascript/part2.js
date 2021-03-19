fs = require('fs');

// Execute an instruction
const executeInstruction = (registers, instructionPointer, instruction) => {

    switch (instruction.opcode) {
        // Half
        case "hlf":
            registers[instruction.register] /= 2;
            instructionPointer += 1;
            break;
        // Triple
        case "tpl":
            registers[instruction.register] *= 3;
            instructionPointer += 1;
            break;
        // Increment
        case "inc":
            registers[instruction.register] += 1;
            instructionPointer += 1;
            break;
        // Jump
        case "jmp":
            instructionPointer += instruction.offset;
            break;
        // Jump if even
        case "jie":
            registers[instruction.register] % 2 === 0 ? instructionPointer += instruction.offset : instructionPointer += 1
            break;
        // jump if one
        case "jio":
            registers[instruction.register] === 1 ? instructionPointer += instruction.offset : instructionPointer += 1;
            break;
        // Error
        default:
            return `Error, this instruction is not recognized (${instruction.opcode})`;
    }
    return [registers, instructionPointer]
}

// Parse the program instructions
const parseInstructions = input => {
    instructionRegExp = /(jio|inc|tpl|jmp|jie|hlf) (a|b)?,? ?((-|\+)[0-9]+)?/;
    let parsedInstructions = [];

    input.forEach(e => {
        tokens = instructionRegExp.exec(e);
        if (tokens) {
            parsedInstructions.push({
                opcode  : tokens[1],
                register: tokens[2] || null,
                offset  : parseInt(tokens[3]) || null
            })
        }
    });
    return parsedInstructions;
}

// Run the program
const run = (program) => {
    // Instruction pointer
    let ip = 0;
    // Registers
    let registers = {
        a: 1,
        b: 0
    };

    while (ip < program.length) {
        [registers, ip] = executeInstruction(registers, ip, program[ip]);
    }
    return registers;
}

fs.readFile('input.txt', 'utf8', function(err, data) {
    if (err) {
        return console.log(err);
    }

    const instructions = parseInstructions(data.split('\n'));
    const result = run(instructions);
    console.log(result);
});