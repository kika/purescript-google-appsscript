module Google.AppsScript.AppsScript
(
    GASEff
  , (:)
)
where

import Prelude
import Effect (Effect)


-- | Effect type for Google AppsScript
type GASEff a = Effect a

infixl 1 bind as :
