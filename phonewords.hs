{-
    This program will build on dictionary.hs and wordsToPhone from a previous
    assignment. You can copy your wordsToPhone source code here or you can simply
    include the line:
    
    import PTfuncsyntax
    
    and run this program in the same directory with your PFfuncsyntax.hs file.
    
    This program will ask the user to enter a 4-digit number. It will then list 
    off all of the english words that can be formed from that number on a standard 
    telephone keypad.
    
    Example of use:
    
    *Main> main
    Type a four-digit number:
    2376
    "Afro"
    "Bern"
    "berm"
    *Main> 

-}

import PTfuncsyntaxCopy
import Data.Char (toLower)
phonewords :: [Int] -> [String] -> Int -> IO ()
phonewords x y z = mapM_ putStrLn [(snd a) | a <- (zip x y), (fst a) == z]
main = do
    putStrLn "Type a four-digit number:"
    dwords <- readFile "/usr/share/dict/american-english"
    let matchnums = map wordsToPhone (lines dwords)
    inum <- readLn
    phonewords matchnums (lines dwords) inum