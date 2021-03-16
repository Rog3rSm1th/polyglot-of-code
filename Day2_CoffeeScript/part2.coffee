fs = require 'fs'
config = 'input.txt'

input = ->
  fs.readFileSync config, 'utf8'

getRibbon = (l, w, h) ->  l*w*h + Math.min 2*l+2*w, 2*l+2*h, 2*w+2*h

result = 0

presents = input.split '\n'

for present in presents
  dimensions = present.split 'x'
  result += getRibbon.apply this, dimensions

console.log result