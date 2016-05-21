module Main where

import Prelude (Unit)
import Control.Monad.Eff
import Google.AppsScript.Logger
import Google.AppsScript.Event

onOpen::forall e. Event -> Eff (log::LOG|e) Unit
onOpen _ = 
  log "onOpen called"

onInstall::forall e. Event -> Eff (log::LOG|e) Unit
onInstall _ = 
  log "onInstall called"

onEdit::forall e. Event -> Eff (log::LOG|e) Unit
onEdit _ = 
  log "onEdit called"
