// module Google.AppsScript.Menu
"use strict";

exports.createAddonMenu = function (ui) {
    return function () {
        return ui.createAddonMenu();
    }
}

exports.addItemImpl = function (caption, funcName, menu) {
    return function () {
        return menu.addItem( caption, funcName );
    }
}

exports.addToUi = function (menu) {
    return function () {
        menu.addToUi();
        return {};
    }
}

exports.addSubMenu = function (submenu) {
    return function (menu) {
        return menu.addSubMenu( submenu );
    }
}

exports.addSeparator = function (menu) {
    return function () {
        return menu.addSeparator();
    }
}
