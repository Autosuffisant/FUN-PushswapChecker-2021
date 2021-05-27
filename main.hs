import System.Environment
import System.Exit ( exitWith, ExitCode(ExitFailure), ExitCode(ExitSuccess) )
import Control.Exception
import Control.Monad
import Functions

convArgs :: [String] -> [Int]
convArgs l = map read l :: [Int]

checkArgs :: [String] -> Bool
checkArgs [] = True
checkArgs (x:xs) =
    case reads x :: [(Int, String)] of
        [(_, "")] -> checkArgs xs
        _ -> False

main :: IO ()
main = do
    args <- getArgs
    number <- getLine
    unless (checkArgs args) (putStrLn "KO")
    unless (checkArgs args) (exitWith (ExitFailure 84))
    let actions = words number
    let cArgs = convArgs args
    let result = doOperation actions (cArgs, [])
    let sorted = if isSorted (fst result) && snd result == [] then True else False
    if sorted then putStrLn "OK" >> exitWith (ExitSuccess) else putStr "KO: " >> print result >> exitWith (ExitFailure 84)

isSorted :: (Ord a) => [a] -> Bool
isSorted [] = False
isSorted [a] = True
isSorted (x:y:xs) = x <= y && isSorted(y:xs)

doActions :: String -> ([Int], [Int]) -> ([Int], [Int])
doActions [] (a, b) = (a, b)
doActions "sa" (a, b) = sa (a, b)
doActions "sb" (a, b) = sb (a, b)
doActions "sc" (a, b) = sc (a, b)
doActions "pa" (a, b) = pa (a, b)
doActions "pb" (a, b) = pb (a, b)
doActions "ra" (a, b) = ra (a, b)
doActions "rb" (a, b) = rb (a, b)
doActions "rr" (a, b) = rr (a, b)
doActions "rra" (a, b) = rra (a, b)
doActions "rrb" (a, b) = rrb (a, b)
doActions "rrr" (a, b) = rrr (a, b)

doOperation :: [String] -> ([Int], [Int]) -> ([Int], [Int])
doOperation xs a = foldl (flip doActions) a xs