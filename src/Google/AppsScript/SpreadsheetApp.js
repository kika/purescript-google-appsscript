"use strict";

exports.app = function () {
   return SpreadsheetApp;
}

exports.getUi = function (app) {
    return function () {
        return app.getUi();
    }
}

exports.getActiveRange = function (sheet) {
    return function () {
        return sheet.getActiveRange();
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

exports.getValue = function (range) {
    return function () {
        return range.getValue();
    }
}

exports.getFormula = function (range) {
    return function () {
        return range.getFormula();
    }
}

exports.getActiveSheet = function (app) {
    return function () {
       return app.getActiveSheet(); 
    }
} //SpreadsheetApp -> GASEff Sheet
exports.getName = function (sheet) {
    return function () {
        return sheet.getName(); 
    }
} //Sheet -> GASEff String
exports.getSheetId = function (sheet) {
    return function () {
        return sheet.getSheetId();    
    }
} //Sheet -> GASEff Int

exports.getRange = function (range) {
    return function (sheet) {
        return function () {
            return sheet.getRange(range);
        }
    }
} // String -> Sheet -> GASEff Range

exports.setActiveRange = function (range) {
    return function (sheet) {
        return function () {
            return sheet.setActiveRange(range);
        }
    }
} // Range -> Sheet -> GASEff Range

exports.getMaxRows = function (sheet) {
    return function () {
        return sheet.getMaxRows();
    }
} // Sheet -> GASEff Int

exports.getMaxColumns = function (sheet) {
    return function () {
        return sheet.getMaxColumns();
    }
} // Sheet -> GASEff Int

exports.getRange2Impl = function (r, c, sheet) {
    return function () {
        return sheet.getRange(r, c);
    }
} // Fn3 Row Column Sheet (GASEff Range)

exports.getRange3Impl = function (r, c, rs, sheet) {
    return function () {
        return sheet.getRange(r, c, rs);
    }
} // Fn4 Row Column Int Sheet (GASEff Range)

exports.getRange4Impl = function (r, c, rs, cs, sheet) {
    return function () {
        return sheet.getRange(r, c, rs, cs);
    }
} // Fn5 Row Column Int Int Sheet (GASEff Range)

