module FRP.Helm.Extras
    ( near
    , onScreen
    )where

{-| Check if two values are within a tolerance -}
near :: (Num a, Ord a) => a -> a -> a -> Bool
near tolerance x y = abs (x - y) <= tolerance
