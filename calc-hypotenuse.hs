-- I used the online compiler https://www.jdoodle.com/execute-haskell-online/
-- to runs this code. :)

hypotenuse :: Float -> Float -> Float
hypotenuse a b = sqrt(a^2 + b^2)

main :: IO ()
main =  do
    
putStr "hypotenuse = "
print(hypotenuse 5 15)