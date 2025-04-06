import Data.Ratio

naturals:: [Integer]
naturals = iterate (+1) 0

--Da una lista infinita de los términos de Taylor
termes_cosinus:: Rational -> [Rational]
termes_cosinus alfa = [ftaylor num| num <- naturals]
    where 
            ftaylor:: Integer -> Rational
            ftaylor n = ((-1) ^ n) * (alfa ^ (2 * n)) / (factorial (2 * n))
            
            factorial:: Integer -> Rational
            factorial 0 = 1
            factorial a = fromIntegral a * factorial (a - 1)

cosinus :: Rational -> Rational -> Rational
cosinus alfa epsilon = foldl (+) 0 $ takeWhile (\x -> abs x >= epsilon) (termes_cosinus alfa)

    
        
