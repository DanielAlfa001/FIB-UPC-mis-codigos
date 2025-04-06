import Data.Ratio

egypt :: Rational -> [Rational] --de fracción a  fracción de numerador unitario
egypt f = reverse $ tail $ myUntil (\l -> head l == 0) next [f]
    where
        next (f:fs) = ((mod (-y) x) % (y * c)) : (1 % c) : fs
            where
                x = numerator f
                y = denominator f
                c = ceiling(y % x)

        
                
myUntil :: (a -> Bool) -> (a -> a) -> a -> a --p predicat, f funció, x  valor
myUntil p f x = head(dropWhile (not.p) (iterate f x));

main:: IO()
main = do
    s <- getContents
    mapM_ (print.egypt.read) (lines s)
        
        
        
    
