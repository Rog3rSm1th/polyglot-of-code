fs = require 'fs'
config = 'input.txt'

input = ->
  fs.readFileSync config, 'utf8'
  
getArea = (l, w, h) -> 2*l*w + 2*w*h + 2*h*l + Math.min l*w, w*h, h*l

result = 0

presents = input.split '\n'

for present in presents
  dimensions = present.split 'x'
  result += getArea.apply this, dimensions

console.log result