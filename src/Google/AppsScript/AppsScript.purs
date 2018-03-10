module Google.AppsScript.AppsScript
(
    GAS
  , GASEff
  , (:)
)
where

import Control.Monad.Eff

import Prelude (bind)

-- | Effect type for Google AppsScript
foreign import data GAS :: Effect
type GASEff a = forall e. Eff (gas::GAS|e) a

infixl 1 bind as :
