-- | Module for debug logger
module Google.AppsScript.Logger 
(
    LOG
  , clear
  , getLog
  , log
) where

import Prelude
import Control.Monad.Eff
import Control.Monad.Eff.Class
import Data.Function

-- | Effect type for logger
foreign import data LOG :: !
foreign import clearImpl::forall e. Fn0 (Eff(log::LOG|e) Unit)
foreign import getLogImpl::forall e. Fn0 (Eff(log::LOG|e) (Array String))
foreign import logImpl::forall e. Fn1 String (Eff(log::LOG|e) Unit)

-- | Clears contents of the log
clear::forall e. Eff(log::LOG|e) Unit
clear = runFn0 clearImpl

-- | Returns the list of messages in the log
getLog::forall e. Eff(log::LOG|e) (Array String)
getLog = runFn0 getLogImpl

-- | Sends the text string to the log
log::forall e. String -> Eff(log::LOG|e) Unit
log msg = runFn1 logImpl msg
