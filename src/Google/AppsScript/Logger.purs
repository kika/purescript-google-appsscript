-- | Module for debug logger
module Google.AppsScript.Logger 
(
    clear
  , getLog
  , log
  , debug
) where

import Prelude
import Google.AppsScript.AppsScript (GASEff)

foreign import debugImpl::forall a b. a -> (Unit -> b) -> b

-- | Clears contents of the log
foreign import clear::GASEff Unit
-- | Returns the list of messages in the log
foreign import getLog::GASEff (Array String)
-- | Sends the text string to the log
foreign import log::String -> (GASEff Unit)

-- | Fake pure logging for debug purposes
debug::forall a. String -> (Unit -> a) -> a
debug = debugImpl

