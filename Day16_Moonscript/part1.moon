-- Parse the input
parse = (line) ->
    index = tonumber line\match '^Sue (%d+):'
    aunts_list[index] = {}
    for object, counter in line\gmatch '(%a+): (%d+)'
        aunts_list[index][object] = tonumber counter

-- Find if line is matching the ticker tape elements
match = (aunt, items, comparer) ->
    for object, counter in pairs aunt
        return false unless (comparer or table[object]) counter, items[object]
    true

-- Iterate through the input
solve = (items, comparer) ->
    for index, aunt in ipairs aunts_list
        return index if match aunt, items, comparer
    -1

-- Solve the challenge
ticker_tape =
    children: 3, cats: 7, samoyeds: 2, pomeranians: 3, akitas: 0
    vizslas: 0, goldfish: 5, trees: 3, cars: 2, perfumes: 1

aunts_list = {}

table = setmetatable {
        cats:        (aunt, ticker_tape) -> aunt > ticker_tape
        trees:       (aunt, ticker_tape) -> aunt > ticker_tape
        pomeranians: (aunt, ticker_tape) -> aunt < ticker_tape
        goldfish:    (aunt, ticker_tape) -> aunt < ticker_tape
    }, { __index: -> (aunt, ticker_tape) -> aunt == ticker_tape }

for line in io.lines 'input.txt', '*l' do parse line
print solve ticker_tape, (x, y) -> x == y
