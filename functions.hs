module Functions where

sa :: ([Int], [Int]) -> ([Int], [Int])
sa ([], yy) = ([], yy)
sa ([x], yy) = ([x], yy)
sa (x:y:xs, yy) = (y:x:xs, yy)

sb :: ([Int], [Int]) -> ([Int], [Int])
sb (xx, []) = (xx, [])
sb (xx, [y]) = (xx, [y])
sb (xx, x:y:xs) = (xx, y:x:xs)

sc :: ([Int], [Int]) -> ([Int], [Int])
sc t = sa $ sb t

pa :: ([Int], [Int]) -> ([Int], [Int])
pa (xx, []) = (xx, [])
pa (xx, x:xs) = (x:xx, xs)

pb :: ([Int], [Int]) -> ([Int], [Int])
pb ([], yy) = ([], yy)
pb (x:xs, yy) = (xs, x:yy)

ra :: ([Int], [Int]) -> ([Int], [Int])
ra ([], yy) = ([], yy)
ra (x:xs, yy) = (xs ++ [x], yy)

rb :: ([Int], [Int]) -> ([Int], [Int])
rb (xx, []) = (xx, [])
rb (xx, x:xs) = (xx, xs ++ [x])

rr :: ([Int], [Int]) -> ([Int], [Int])
rr t = ra $ rb t

rra :: ([Int], [Int]) -> ([Int], [Int])
rra ([], yy) = ([], yy)
rra (xx, yy) = (last xx:init xx, yy)

rrb :: ([Int], [Int]) -> ([Int], [Int])
rrb (xx, []) = (xx, [])
rrb (xx, yy) = (xx, last yy:init yy)

rrr :: ([Int], [Int]) -> ([Int], [Int])
rrr t = rra $ rrb t