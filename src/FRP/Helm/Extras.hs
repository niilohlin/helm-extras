
{-| Checks if two values are within a tolerance -}
near :: Double -> Double -> Double -> Bool
near tolerance x y = abs (x - y) <= tolerance
