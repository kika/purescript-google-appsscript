// module Google.AppsScript.SpreadsheetApp

"use strict";

exports.app = function () {
   return SpreadsheetApp;
}

exports.getUi = function (app) {
    return function () {
        return app.getUi();
    }
}

exports.getActiveRange = function (app) {
    return function () {
        return app.getActiveRange();
    }
} // SpreadsheetApp -> GASEff Range

exports.getColumn = function (range) {
    return function () {
        return range.getColumn();
    }
} // Range -> GASEff Int

exports.getCellImpl = function (range, row, col) {
    return function () {
        return range.getCell( row, col );
    }
} // Range -> Row -> Column -> GASEff Range

exports.getLastColumn = function (range) {
    return function () {
        return range.getLastColumn();
    }
} // Range -> GASEff Column

exports.getLastRow = function (range) {
    return function () {
        return range.getLastRow();
    }
} // Range -> GASEff Row

exports.getNumRows = function (range) { 
    return function () {
        return range.getNumRows();
    }
} // Range -> GASEff Int

exports.getNumColumns = function (range) {
    return function () {
        return range.getNumColumns();
    }
} // Range -> GASEff Int

exports.getA1Notation = function (range) {
    return function () {
        return range.getA1Notation();
    }
}

