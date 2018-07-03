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
  , getActiveSheet
  , getSheetId
  , getName
  , getRange2
  , getRange3
  , getRange4
  , setActiveRange
  , getMaxColumns
  , getMaxRows
) where

import Data.Function.Uncurried (Fn3, Fn5, Fn4, runFn5, runFn4, runFn3)
import Foreign (Foreign)

import Google.AppsScript.AppsScript (GASEff)
import Google.AppsScript.Ui (Ui)

foreign import data SpreadsheetApp :: Type
foreign import data Spreadsheet :: Type
foreign import data Sheet :: Type
foreign import data Range :: Type

type Row    = Int
type Column = Int

foreign import app::GASEff SpreadsheetApp
foreign import getUi::SpreadsheetApp -> GASEff Ui

-- Sheet functions
foreign import getActiveSheet::SpreadsheetApp -> GASEff Sheet
foreign import getName::Sheet -> GASEff String
foreign import getSheetId::Sheet -> GASEff Int
foreign import getMaxRows::Sheet -> GASEff Int
foreign import getMaxColumns::Sheet -> GASEff Int

-- Range functions
foreign import getRange::String -> Sheet -> GASEff Range
foreign import getRange2Impl::Fn3 Row Column Sheet (GASEff Range)
foreign import getRange3Impl::Fn4 Row Column Int Sheet (GASEff Range)
foreign import getRange4Impl::Fn5 Row Column Int Int Sheet (GASEff Range)
foreign import setActiveRange::Range -> Sheet -> GASEff Range
foreign import getActiveRange::Sheet -> GASEff Range
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
getRange2::Row -> Column -> Sheet -> GASEff Range
getRange2 row col sheet = runFn3 getRange2Impl row col sheet
getRange3::Row -> Column -> Int -> Sheet -> GASEff Range
getRange3 row col rows sheet = runFn4 getRange3Impl row col rows sheet
getRange4::Row -> Column -> Int -> Int -> Sheet -> GASEff Range
getRange4 row col rows cols sheet = runFn5 getRange4Impl row col rows cols sheet

