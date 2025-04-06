main :: IO ()
main = getLine >>= \x -> putStrLn (salute(x))
         where salute (a:bs)
                           |a == 'A' || a =='a' = "Hello!"
                           |otherwise = "Bye!"
