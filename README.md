helm-extras
===========

##Animation Example.

```Haskell
import FRP.Helm
import FRP.Helm.Window
import FRP.Helm.Time
import FRP.Helm.Extras.Animation

frames :: Animation
frames = relative [
   (1000, filled red   $ square 100)
  ,(1000, filled green $ square 100)
  ,(1000, filled blue  $ square 100)
  ]

render :: (Int, Int) -> Form -> Element
render (w, h) animation = centeredCollage w h [animation]

main :: IO ()
main = run defaultConfig $ render <~ dimensions ~~ animate frames (fps 60) (constant Cycle)
```
##Transition Example
```Haskell

import FRP.Helm
import FRP.Helm.Window
import FRP.Helm.Time
import FRP.Helm.Extras.Transition

trans :: Signal Color
trans = transition (fps 60) (constant Cycle) $ fromList [
   (white, 0)
  ,(green, 2 * second)
  ,(red, 5 * second)
  ,(black, 1 * second)
  ,(yellow, 2 * second)
  ]

render :: (Int, Int) -> Color -> Element
render (w, h) color = centeredCollage w h [filled color $ square 100]

main :: IO ()
main = run defaultConfig $ render <~ dimensions ~~ trans

```
