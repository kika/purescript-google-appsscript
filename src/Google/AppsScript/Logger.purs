-- | Module for debug logger
module Google.AppsScript.Logger 
(
    clear
  , getLog
  , log
) where

import Prelude
import Control.Monad.Eff
import Control.Monad.Eff.Class
import Data.Function
import Google.AppsScript.AppsScript (GAS)

foreign import clearImpl::forall e. Fn0 (Eff(log::GAS|e) Unit)
foreign import getLogImpl::forall e. Fn0 (Eff(log::GAS|e) (Array String))
foreign import logImpl::forall e. Fn1 String (Eff(log::GAS|e) Unit)

-- | Clears contents of the log
clear::forall e. Eff(log::GAS|e) Unit
clear = runFn0 clearImpl

-- | Returns the list of messages in the log
getLog::forall e. Eff(log::GAS|e) (Array String)
getLog = runFn0 getLogImpl

-- | Sends the text string to the log
log::forall e. String -> Eff(log::GAS|e) Unit
log msg = runFn1 logImpl msg
