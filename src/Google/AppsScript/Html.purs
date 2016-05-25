module Google.AppsScript.Html 
(
    HtmlService
  , HtmlOutput
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
foreign import setSandboxMode::GASEff HtmlOutput

createHtmlOutputFromFile:: String -> HtmlService -> GASEff HtmlOutput
createHtmlOutputFromFile file htmlo =
  runFn2 createHtmlOutputFromFileImpl file htmlo 
setTitle::String -> HtmlOutput -> GASEff HtmlOutput 
setTitle title htmlo = runFn2 setTitleImpl title htmlo
setWidth::Int -> HtmlOutput -> GASEff HtmlOutput      
setWidth width htmlo = runFn2 setWidthImpl width htmlo
