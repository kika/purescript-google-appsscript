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
import Google.AppsScript.AppsScript (GAS, GASEff)

foreign import clearImpl::GASEff Unit
foreign import getLogImpl::GASEff (Array String)
foreign import logImpl::String -> (GASEff Unit)

-- | Clears contents of the log
clear::GASEff Unit
clear = clearImpl

-- | Returns the list of messages in the log
getLog::GASEff (Array String)
getLog = getLogImpl

-- | Sends the text string to the log
log::String -> GASEff Unit
log = logImpl
