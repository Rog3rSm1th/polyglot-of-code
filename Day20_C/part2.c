// gcc part2.c -o part2 -lm

#include <stdio.h>
#include <math.h>
#define INPUT 33100000 

int solve(int counter) {
    int result = 0;
    int delta = (int) sqrt((double) counter) + 1;
    for (int i = 1; i <= delta; ++i) {
        if (counter % i == 0) {
            // Elf will stop after delivering presents to 50 houses
            if (i <= 50)
                result += counter/i;
            if (counter/i <= 50)
                result += i;
        }
    }
    result = result * 11;
    return result;
}

void main() {
    int counter = 1;
    while (solve(counter) < INPUT)
        counter += 1;
    printf("%d\n", counter);
}