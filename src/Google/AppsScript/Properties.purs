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

import Prelude
import Data.Function (Fn2, Fn3, runFn2, runFn3)
import Data.Maybe (Maybe)
import Data.Nullable (toMaybe, Nullable)
import Data.StrMap (StrMap)
import Google.AppsScript.AppsScript (GASEff)

foreign import data Properties :: *
type Props = StrMap String

foreign import getDocProps::GASEff Properties
foreign import getScriptProps::GASEff Properties
foreign import getUserProps::GASEff Properties

foreign import delAll::Properties -> GASEff Properties
foreign import delImpl:: Fn2 String Properties (GASEff Properties)
foreign import keys::Properties -> GASEff (Array String)
foreign import getAll::Properties -> GASEff Props 
foreign import getImpl:: Fn2 String Properties (GASEff (Nullable String))
foreign import setAllImpl:: Fn2 Props Properties (GASEff Properties)
foreign import setImpl:: Fn3 String String Properties (GASEff Properties)

set::String -> String -> Properties -> GASEff Properties
set k v p = runFn3 setImpl k v p
setAll::Props -> Properties -> GASEff Properties
setAll pp p = runFn2 setAllImpl pp p
get::String -> Properties -> GASEff (Maybe String)
get k p = toMaybe <$> runFn2 getImpl k p
del::String -> Properties -> GASEff Properties
del k p = runFn2 delImpl k p 
