// module Google.AppsScript.Ui

"use strict";

exports.alert = function (msg) {
    return function (ui) {
        switch (ui.alert(msg)) {
            case ui.Button.CLOSE:
                return Close.create();
            case ui.Button.OK:
                return Ok.create();
            case ui.Button.CANCEL:
                return Cancel.create();
            case ui.Button.YES:
                return Yes.create();
            case ui.Button.NO:
            default:
                return No.create();
        }
    }
}
