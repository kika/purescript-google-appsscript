module Google.AppsScript.AppsScript 
(
    GAS
  , GASEff
  , (:)
) 
where

import Prelude (bind)
import Control.Monad.Eff

-- | Effect type for Google AppsScript
foreign import data GAS :: !
type GASEff a = forall e. Eff (gas::GAS|e) a

infixl 1 bind as :
