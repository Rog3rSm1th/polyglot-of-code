// gcc part1.c -o part1 -lm

#include <stdio.h>
#include <math.h>
#define INPUT 33100000 

int solve(int counter) {
    int result = 0;
    int delta = (int) sqrt((double) counter) + 1;
    for (int i = 1; i <= delta; ++i) {
        if (counter % i == 0) {
            result += i;
            result += counter/i;
        }
    }
    result = result * 10;
    return result;
}

void main() {
    int counter = 1;
    while (solve(counter) < INPUT)
        counter += 1;
    printf("%d\n", counter);
}