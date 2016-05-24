// module Google.AppsScript.Ui

"use strict";

exports.alert = function (msg) {
    return function (ui) {
        switch (ui.alert(msg)) {
            case ui.Button.CLOSE:
                return exports.Close;
            case ui.Button.OK:
                return exports.Ok;
            case ui.Button.CANCEL:
                return exports.Cancel;
            case ui.Button.YES:
                return exports.Yes;
            case ui.Button.NO:
            default:
                return exports.No;
        }
    }
}

exports.alertButtons = function (msg) {
    return function (btnset) {
        return function (ui) {
        }
    }
}

exports.alertTitle = function (title) {
    return function (msg) {
        return function (btnset) {
            return function (ui) {
            }
        }
    }
}
