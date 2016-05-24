module Google.AppsScript.SpreadsheetApp 
(
    SpreadsheetApp
  , app
  , getUi
) where

import Prelude
import Google.AppsScript.AppsScript (GAS, GASEff)
import Google.AppsScript.Ui (Ui)
import Google.AppsScript.Menu (Menu)

foreign import data SpreadsheetApp :: *

foreign import app::GASEff SpreadsheetApp
foreign import getUi::SpreadsheetApp -> GASEff Ui

