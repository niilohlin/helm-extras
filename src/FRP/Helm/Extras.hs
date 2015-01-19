module FRP.Helm.Extras
    ( near
    , wrap
    , foldp2
    )where

import FRP.Helm (foldp, (<~), (~~), Signal)

{-| Check if two values are within a tolerance -}
near :: (Num a, Ord a) => a -> a -> a -> Bool
near tolerance x y = abs (x - y) <= tolerance

{-| Wraps the third argument within given range. -}
wrap :: (Ord a, Num a) => a -> a -> a -> a
wrap a b c
    | a <= c && c < b = c
    | c <= a     = wrap a b (c + b - a)
    | otherwise = wrap a b (c - b - a)

{-| Fold over two signals. -}
foldp2 :: (a -> b1 -> b -> b) -> b -> Signal a -> Signal b1 -> Signal b
foldp2 fn ini s1 s2 = foldp (uncurry fn) ini ((,) <~ s1 ~~ s2)
