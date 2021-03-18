#!/usr/bin/env python3
#-*- coding: utf-8 -*-

from itertools import combinations

def solve(packages, groups):

    total = sum(packages)
    result = 9999999999999999

    # we should use `for i in range(1, len(packages) - 2)` but it would 
    # make the computation significantly slower
    for i in range(1, 7):
        for c in combinations(packages, i):
            if sum(c) == total / groups:
                quantum_entanglement = reduce(lambda a, b: a * b, list(c))
                result = min(result, quantum_entanglement)
    return result

packages = [int(num) for num in open('input.txt')]
print(solve(packages, 3))