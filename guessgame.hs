{-
    The following program is a game that asks the user to think of a number between 
    one and ten. The program asks a series of yes or no questions to figure out what
    the number is. The program is not very clever.
    
    Your task is to modify this program so that it asks the user to think of a number
    between one and one thousand! Your program should be able to guess the number 
    in only eleven questions or fewer! 
    
    Hint: You can ask questions like, "Is your number greater than 500?"
    Hint: You can change as much of this program as you want. It is only
          here to serve as a simple example.
          
    Here is some sample output (I am thinking of the number 889):

    Think of a number between 1 and 1000 and I will guess it.
    Is your number greater than 500? (answer "yes" or "no") 
    yes
    Is your number greater than 750? (answer "yes" or "no") 
    yes
    Is your number greater than 875? (answer "yes" or "no") 
    yes
    Is your number greater than 938? (answer "yes" or "no") 
    no
    Is your number greater than 907? (answer "yes" or "no") 
    no
    Is your number greater than 891? (answer "yes" or "no") 
    no
    Is your number greater than 883? (answer "yes" or "no") 
    yes
    Is your number greater than 887? (answer "yes" or "no") 
    yes
    Is your number greater than 889? (answer "yes" or "no") 
    no
    Is your number 888? (answer "yes" or "no") 
    no
    Your number is 889, right? (answer "yes" or "no") 
    yes
    I KNEW IT! Thank you.
    
-}
guessIt :: Int -> Int -> IO ()
guessIt minb maxb = do
    let s = ([minb..maxb] !! ((length [minb..maxb]) `div` 2)-1)
    if length [minb..maxb] == 1
        then do putStrLn ("Your number is " ++ show s ++ ", right? (answer \"yes\" or \"no\") ") 
                guess <- getLine
                (if guess == "yes"
                    then putStrLn ("I KNEW IT! Thank you.")
                    else putStrLn ("Umm... I don't really know what happened there, but something went wrong."))
                main
        else do putStrLn ("Is your number greater than " ++ show s ++ "? (answer \"yes\" or \"no\") ")
                guess <- getLine
                (if guess == "yes"
                    then guessIt ([minb..maxb] !! ((length [minb..maxb]) `div` 2)) maxb
                    else guessIt minb ([minb..maxb] !! ((length [minb..maxb]) `div` 2)))


main = do
    putStrLn "Think of a number between 1 and 1000 and I will guess it."
    guessIt 1 1000

