module Google.AppsScript.SpreadsheetApp 
(
    SpreadsheetApp
  , Row
  , Column
  , Sheet
  , Range
  , app
  , getUi
  , getColumn
  , getCell
  , getLastColumn
  , getLastRow
  , getNumRows
  , getNumColumns  
  , getActiveRange
  , getA1Notation
  , getValue
  , getFormula
) where

import Prelude
import Data.Function
import Data.Foreign 
import Data.Foreign.Class

import Google.AppsScript.AppsScript (GAS, GASEff)
import Google.AppsScript.Ui (Ui)
import Google.AppsScript.Menu (Menu)

foreign import data SpreadsheetApp :: *
foreign import data Sheet :: *
foreign import data Range :: *

type Row    = Int
type Column = Int

foreign import app::GASEff SpreadsheetApp
foreign import getUi::SpreadsheetApp -> GASEff Ui

-- Range functions
foreign import getActiveRange::SpreadsheetApp -> GASEff Range
foreign import getColumn::Range -> GASEff Int
foreign import getCellImpl::Fn3 Range Row Column (GASEff Range)
foreign import getLastColumn::Range -> GASEff Column
foreign import getLastRow::Range -> GASEff Row
foreign import getNumRows::Range -> GASEff Int
foreign import getNumColumns::Range -> GASEff Int
foreign import getA1Notation::Range -> GASEff String
foreign import getValue::Range -> GASEff Foreign
foreign import getFormula::Range -> GASEff String

getCell::Row -> Column -> Range -> GASEff Range
getCell row col range = runFn3 getCellImpl range row col 
