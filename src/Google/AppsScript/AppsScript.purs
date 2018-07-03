module Google.AppsScript.AppsScript
(
    GAS
  , GASEff
  , (:)
)
where

import Prelude
import Effect (kind Effect)


-- | Effect type for Google AppsScript
foreign import data GASEff :: Effect a
-- type GASEff a = forall e. Effect (gas::GAS|e) a

infixl 1 bind as :
