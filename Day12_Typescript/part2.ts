import { readFileSync } from 'fs';

class Day12 {
    
    static solve(input: String): number {
        let objectArray: Array<any>;

        if (Array.isArray(input))
            objectArray = input;
        else {
            objectArray = Object.keys(input).map(key => input[key]);
            if (objectArray.includes("red")) return 0;
        }

        return objectArray.reduce((total, element) => {
            let result: number = 0;

            if (typeof element === "number")
                result = element;
            else if (typeof element === "object")
                result = this.solve(element);
            return total + result;
        }, 0);
    }
}

const input = readFileSync('./input.txt', 'utf-8');
const result: number = Day12.solve(JSON.parse(input));

console.log(result);
