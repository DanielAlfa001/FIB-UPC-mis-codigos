absValue::Int -> Int
absValue n
    | n >= 0 = n
    | otherwise = -n

power::Int -> Int -> Int
power x 0 = 1
power x p = x * power x (p-1)

isPrime::Int -> Bool
isPrime n
    | n < 2 = False
    |otherwise = aux 2
    where
        aux d
            |div n 2 < d = True
            |mod n d == 0 = False
            |otherwise = aux (d+1)

slowFib::Int -> Int
slowFib n = fib n
    where
        fib m
            |m == 0 = 0
            |m == 1 = 1
            |otherwise = fib (m-2) + fib (m-1)


quickFib::Int -> Int
quickFib n = fib 0 1 n
    where
        fib a b m
            |m == 0 = 0
            |m == 1 = b
            |otherwise = fib b (a+b) (m-1)



