-- I used the online compiler https://www.jdoodle.com/execute-haskell-online/
-- to runs this code. :)

normalize :: [Float] -> [Float]
normalize numbers = map (/max) numbers
  where max = maximum numbers

main :: IO ()
main =  do

print(normalize [2, 6, 8, 50, 5, 10, 7, 3])
print(normalize [4, 6, 5, 10, 7, 3])
print(normalize [1, 3, 5, 11, 70, 30])