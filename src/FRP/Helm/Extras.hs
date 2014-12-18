module FRP.Helm.Extras
    ( near
    , onScreen
    )where

{-| Check if two values are within a tolerance -}
near :: (Num a, Ord a) => a -> a -> a -> Bool
near tolerance x y = abs (x - y) <= tolerance

{-| Check if a point is on the screen -}
onScreen :: (Fractional a, Ord a) => (a, a) -> (Int, Int) -> Bool
onScreen (x, y) (w, h) = (-w' / 2) < x && x < (w' / 2) &&
                         (-h' / 2) < y && y < (h' / 2)
                            where
                                w' = fromIntegral w
                                h' = fromIntegral h
