import { readFileSync } from 'fs';

class Day12 { 

    static solve(input: string): number { 
        let objectArray: Array<any> = Array.isArray(input) ? input : Object.keys(input).map(key => input[key]);
        return objectArray.reduce((total, element) => {
            let result: number = 0;
            let typeOfElement: String = typeof element;
            
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
