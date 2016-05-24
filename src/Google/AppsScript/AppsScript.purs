module Google.AppsScript.AppsScript 
(
    GAS
  , GASEff
) 
where

import Control.Monad.Eff

-- | Effect type for Google AppsScript
foreign import data GAS :: !
type GASEff a = forall e. Eff (gas::GAS|e) a
