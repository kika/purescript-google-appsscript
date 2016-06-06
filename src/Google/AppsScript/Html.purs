module Google.AppsScript.Html 
(
    HtmlService
  , HtmlOutput
  , html
  , createHtmlOutputFromFile
  , setTitle
  , setWidth
  , setSandboxMode
) where

import Data.Function
import Google.AppsScript.AppsScript (GASEff)

foreign import data HtmlService :: *
foreign import data HtmlOutput  :: *


foreign import html::GASEff HtmlService
foreign import createHtmlOutputFromFileImpl::
               Fn2 String HtmlService (GASEff HtmlOutput)
foreign import setTitleImpl::Fn2 String HtmlOutput (GASEff HtmlOutput)
foreign import setWidthImpl::Fn2 Int HtmlOutput (GASEff HtmlOutput)
-- the only supported mode now is IFRAME 
-- so there is no point in passing it as a parameter
foreign import setSandboxMode::HtmlOutput -> GASEff HtmlOutput

createHtmlOutputFromFile:: String -> HtmlService -> GASEff HtmlOutput
createHtmlOutputFromFile f h = runFn2 createHtmlOutputFromFileImpl f h
setTitle::String -> HtmlOutput -> GASEff HtmlOutput 
setTitle t h = runFn2 setTitleImpl t h
setWidth::Int -> HtmlOutput -> GASEff HtmlOutput      
setWidth w h = runFn2 setWidthImpl w h
