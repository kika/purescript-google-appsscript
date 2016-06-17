module Google.AppsScript.Ui 
(
    Ui
  , Button(..)
  , ButtonSet(..)
  , alert
  , alertButtons
  , alertTitle
  , showSidebar
  {-
  , prompt
  , createAddonMenu
  -}
) where

import Prelude
import Data.Function.Uncurried (Fn2, Fn5, Fn4, Fn3, 
                                runFn2, runFn5, runFn4, runFn3)
import Google.AppsScript.AppsScript (GASEff)
import Google.AppsScript.Html (HtmlOutput)

foreign import data Ui:: *

data Button = Close | Ok | Cancel | Yes | No
data ButtonSet = OkAlone | OkCancel | YesNo | YesNoCancel

foreign import alertImpl::Fn3      (Array Button) 
                                   String Ui (GASEff Button)
foreign import alertBtnsImpl::Fn4  (Array Button) 
                                   String ButtonSet Ui (GASEff Button)
foreign import alertTitleImpl::Fn5 (Array Button) 
                                   String String ButtonSet Ui (GASEff Button)
foreign import showSidebarImpl::Fn2 HtmlOutput Ui (GASEff Unit)

btns::Array Button 
btns = [Close, Ok, Cancel, Yes, No]

alert::String -> Ui -> GASEff Button
alert msg ui = runFn3 alertImpl btns msg ui

alertButtons::String -> ButtonSet -> Ui -> GASEff Button
alertButtons msg btnset ui = runFn4 alertBtnsImpl btns msg btnset ui

alertTitle::String -> String -> ButtonSet -> Ui -> GASEff Button
alertTitle title msg btnset ui = runFn5 alertTitleImpl btns title msg btnset ui

showSidebar::HtmlOutput -> Ui -> GASEff Unit
showSidebar html ui = runFn2 showSidebarImpl html ui
