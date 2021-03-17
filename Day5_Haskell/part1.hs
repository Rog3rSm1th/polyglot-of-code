module Day5_Haskell.Part1 where

import Data.List

-- Nice string filters 
niceString :: String -> Bool
niceString str =
    -- First property
    length [x | x <- str, x `elem` "aeiou"] >= 3 &&
    -- Second property
    or (zipWith (==) str (tail str)) &&
    -- Third property
    not (or [badStr `isInfixOf` str | badStr <- ["ab", "cd", "pq", "xy"]])

result :: [String] -> Int
result = length . filter niceString

main :: IO ()
main = do
    input <- readFile "input.txt"
    let l = lines input
    print (result l)
