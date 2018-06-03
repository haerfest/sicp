iterativeImprove goodEnoughPred improve = (\initialGuess -> try initialGuess)
    where
        try guess
            | goodEnoughPred guess = guess
            | otherwise            = try $ improve guess

sqrt x = (iterativeImprove goodEnoughPred improve) 1.0
    where
        goodEnoughPred guess = abs (x - square guess) < 0.001
        improve guess        = average guess (x / guess)

square x = x * x
average x y = (x + y) / 2

fixedPoint f firstGuess = (iterativeImprove goodEnoughPred f) firstGuess
    where
        goodEnoughPred guess = abs (guess - f guess) < 0.00001