myMap :: (a -> b) -> [a] -> [b]
myMap func list = [func x | x <- list]

myFilter:: (a -> Bool) -> [a] -> [a]
myFilter cond list = [x | x <- list, cond x]

myZipWith:: (a -> b -> c) -> [a] -> [b] -> [c]
myZipWith func l1 l2 = [func x y | (x,y) <- zip l1 l2]

thingify::[Int] -> [Int] -> [(Int, Int)]
thingify l1 l2 = [(x,y) | x <- l1, y <- l2, mod x y == 0]

factors::Int -> [Int]
factors m = [x | x <- [1..m], (mod m x == 0)]
