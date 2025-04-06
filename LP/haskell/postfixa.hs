main :: IO ()
main = do
        c <- getContents
        mapM_ (print.avalua) (lines c)
        
avalua::String -> Either String Int --recibo filas envío left/write + un valor/string
avalua s = pf (words s) []
        where
            pf::[String] -> [Int] -> Either String Int -- lista de inputs + lista de números
            pf [] [x] = Right x --resultado final
            pf (x:xs) pnum
                    |(elem x ["+","-","*","/"]) = opMaths x pnum xs --si es un operador
                    | otherwise = pf xs ((read x):pnum) --si es un número
            opMaths :: String -> [Int] -> [String] -> Either String Int
            opMaths "+" (x:y:pila) xs = pf xs ((y + x):pila)
            opMaths "-" (x:y:pila) xs
                    |x > y = Left "neg"
                    |otherwise = pf xs ((y - x):pila)
            opMaths "*" (x:y:pila) xs = pf xs ((y * x):pila)
            opMaths "/" (x:y:pila) xs
                    | x == 0 = Left "div0"
                    | (mod y x) /= 0 = Left "divE"
                    |otherwise = pf xs ((div y x):pila)
                    
