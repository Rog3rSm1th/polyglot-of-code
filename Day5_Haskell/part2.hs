module Day5_Haskell.Part2 where

import Data.List

-- Nice string filters
niceString :: String -> Bool
niceString str =
    -- First property 
    or [take 2 t `isInfixOf` drop 2 t | t <- tails str, length t >= 2] &&
    -- Second property 
    not (null [letter1 | letter1:_:letter3:_ <- tails str, letter1 == letter3])

result :: [String] -> Int
result =  length . filter niceString

main :: IO ()
main = do
    input <- readFile "input.txt"
    let l = lines input
    print (result l)
