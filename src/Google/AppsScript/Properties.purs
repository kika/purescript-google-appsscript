module Google.AppsScript.Properties
(
    Properties
  , getDocProps
  , getScriptProps
  , getUserProps
  , deleteAll
  , delete
  , keys
  , getAll
  , get
  , setAll
  , set
) where

import Data.Foreign
import Data.StrMap
import Control.Monad.Eff
import Google.AppsScript.AppsScript (GASEff)

foreign import data Properties :: *
type Props = StrMap String

foreign import getDocProps::GASEff Properties
foreign import getScriptProps::GASEff Properties
foreign import getUserProps::GASEff Properties

foreign import deleteAll::Properties -> GASEff Properties
foreign import delete::String -> Properties -> GASEff Properties
foreign import keys::Properties -> GASEff (Array String)
foreign import getAll::Properties -> GASEff Props 
foreign import get::String -> Properties -> GASEff String
foreign import setAll::Props -> Properties -> GASEff Properties 
foreign import set::String -> String -> Properties -> GASEff Properties
