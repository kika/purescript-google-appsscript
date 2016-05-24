module Google.AppsScript.Ui 
(
    Ui
  , Button(..)
  , ButtonSet
  , alert
  {-
  , prompt
  , createAddonMenu
  -}
) where

import Google.AppsScript.AppsScript (GASEff)

foreign import data Ui:: *

data Button = Close | Ok | Cancel | Yes | No
data ButtonSet = Ok | OkCancel | YesNo | YesNoCancel

foreign import alert::String -> Ui -> GASEff Button
