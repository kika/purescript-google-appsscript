module Google.AppsScript.Menu
(
    Menu
  , createAddonMenu
  , addItem
  , addToUi
  , addSeparator
  , addSubMenu
) where 

import Prelude (Unit)
import Google.AppsScript.AppsScript (GASEff)
import Google.AppsScript.Ui (Ui)

foreign import data Menu :: *
foreign import createAddonMenu::Ui -> GASEff Menu
foreign import addItem::String -> String -> Menu -> GASEff Menu
foreign import addToUi::Menu -> GASEff Unit
foreign import addSeparator::Menu -> GASEff Menu
foreign import addSubMenu::Menu -> Menu -> GASEff Menu
