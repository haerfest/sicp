iterativeImprove :: (t -> Bool) -> (t -> t) -> (t -> t)
iterativeImprove goodEnoughPred improve = (\initialGuess -> try initialGuess)
    where
        try guess
            | goodEnoughPred guess = guess
            | otherwise            = try $ improve guess

sqrt :: (Ord a, Fractional a) => a -> a
sqrt x = (iterativeImprove goodEnoughPred improve) 1.0
    where
        goodEnoughPred guess = abs (x - square guess) < 0.001
        improve guess        = average guess (x / guess)

square :: Num a => a -> a
square x = x * x

average :: Fractional a => a -> a -> a
average x y = (x + y) / 2

fixedPoint :: (Ord a, Fractional a) => (a -> a) -> a -> a
fixedPoint f firstGuess = (iterativeImprove goodEnoughPred f) firstGuess
    where
        goodEnoughPred guess = abs (guess - f guess) < 0.00001