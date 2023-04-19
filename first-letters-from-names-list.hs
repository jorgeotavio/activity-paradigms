-- I used the online compiler https://www.jdoodle.com/execute-haskell-online/
-- to runs this code. :)

firsLetters :: [String] -> [Char]
firsLetters names = map head names

main :: IO ()
main =  do

print(firsLetters ["josé", "maria", "joao", "pedro"])