module Google.AppsScript.Properties
(
    Properties
  , Props
  , getDocProps
  , getScriptProps
  , getUserProps
  , delAll
  , del
  , keys
  , getAll
  , get
  , setAll
  , set
) where

import Data.StrMap (StrMap)
import Google.AppsScript.AppsScript (GASEff)

foreign import data Properties :: *
type Props = StrMap String

foreign import getDocProps::GASEff Properties
foreign import getScriptProps::GASEff Properties
foreign import getUserProps::GASEff Properties

foreign import delAll::Properties -> GASEff Properties
foreign import del::String -> Properties -> GASEff Properties
foreign import keys::Properties -> GASEff (Array String)
foreign import getAll::Properties -> GASEff Props 
foreign import get::String -> Properties -> GASEff String
foreign import setAll::Props -> Properties -> GASEff Properties 
foreign import set::String -> String -> Properties -> GASEff Properties
