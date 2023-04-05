module Main (main) where

--import System.Random

-- | elem' is elem function using left fold
elem' y ys = foldl (\acc x -> if x == y then True else acc) False ys

sum' :: (Num a) => [a] -> a
sum' xs = foldl f 0 xs
  where f acc x = acc + x

sqrtSums :: Int
sqrtSums = length (takeWhile (<1000) (scanl1 (+) (map sqrt [1..]))) + 1

zip3' :: [Int]
zip3' = map (*3) . zipWith max [1,2,3,4,5] $ [4,5,6,7,8]

--main = do
--  foo <- putStrLn "hello" -- foo is type ()
--  putStrLn ("Hello world!" ++ foo)

--main = do
--    rs <- sequence [getLine, getLine, getLine]
--    print rs

-- interact takes a function of type String -> String as a parameter
-- returns an I/O action that takes input until the EOF, run the function on it,
-- and print out the function result.
--main = interact $ unlines . filter ((<10) . length) . lines

-- Even though we made a program that transforms one big string of input into another,
-- it acts like we made a program that does it line by line
main = interact $ respondPalindromes
respondPalindromes = unlines . map (\xs -> if isPalindrome xs then "palindrome" else "not a palindrome") . lines
    where   isPalindrome xs = xs == reverse xs


--main = do
--    gen <- getStdGen
--    putStr $ take 20 (randomRs ('a','z') gen)
