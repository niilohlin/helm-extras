module FRP.Helm.Extras
    ( near
    , clamp
    , wrap
    )where

{-| Check if two values are within a tolerance -}
near :: (Num a, Ord a) => a -> a -> a -> Bool
near tolerance x y = abs (x - y) <= tolerance

{-| "Clamps" the third argument within given range. -}
clamp :: Ord a => a -> a -> a -> a
clamp a b = min b . max a

{-| Wraps the third argument within given range. -}
wrap :: (Ord a, Num a) => a -> a -> a -> a
wrap a b c
    | a <= c && c < b = c
    | c <= a     = wrap a b (c + b - a)
    | otherwise = wrap a b (c - b - a)

