require "big"

# We use modular exponentiation
module Integer 
  module Powmod
 
    def powmod(e, m)
      r, b = 1, self.to_big_i
      while e > 0
        r = (b * r) % m if e.odd?
        b = (b * b) % m
        e >>= 1
      end
      r
    end
  end
end
 
struct Int; include Integer::Powmod end
 
row = 2978
col = 3083

start    = 20151125
base     = 252533
modulo   = 33554393

n = (row + col - 1) * (row + col - 2) // 2 + col - 1
puts ((start * base.powmod(n, modulo)) % modulo)