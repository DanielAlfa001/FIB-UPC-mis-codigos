main :: IO ()
main = do
    contents <- getContents
    mapM_ (putStrLn . tractar) (lines contents)

tractar :: String -> String
tractar s 
        |imc < 18  = sn ++ ": underweight"
        |(imc > 18 && imc < 25) = sn ++ ": normal weight"
        |(imc > 25 && imc < 30) = sn ++ ": overweight"
        |(imc > 30 && imc < 40) = sn ++ ": obese"
        |imc > 40 = sn ++ ": severely obese"
        where 
                [sn, sp, sh] = words s
                p = read sp
                h = read sh
                imc = p / (h * h)
        
        
        
    
