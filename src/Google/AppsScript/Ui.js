// module Google.AppsScript.Ui

"use strict";

exports.alertImpl = function (buttons, msg, ui) {
    return function () {
        switch (ui.alert(msg)) {
            case ui.Button.CLOSE:
                return buttons[0];
            case ui.Button.OK:
                return buttons[1];
            case ui.Button.CANCEL:
                return buttons[2];
            case ui.Button.YES:
                return buttons[3];
            case ui.Button.NO:
            default:
                return buttons[4];
        }
    }
}

function btnset(ui, btns) {
    switch (btns.constructor.name) {
        case 'OkCancel':
            return ui.ButtonSet.OK_CANCEL;
            break;
        case 'YesNo':
            return ui.ButtonSet.YES_NO;
            break;
        case 'YesNoCancel':
            return ui.ButtonSet.YES_NO_CANCEL;
            break;
        case 'OkAlone':
        default:
            return ui.ButtonSet.OK;
            break;
    }
}

exports.alertBtnsImpl = function (buttons, msg, btns, ui) {
    return function () {
        switch (ui.alert(msg, btnset(ui, btns))) {
            case ui.Button.CLOSE:
                return buttons[0];
            case ui.Button.OK:
                return buttons[1];
            case ui.Button.CANCEL:
                return buttons[2];
            case ui.Button.YES:
                return buttons[3];
            case ui.Button.NO:
            default:
                return buttons[4];
        }
    }
}

exports.alertTitleImpl = function (buttons, title, msg, btns, ui) {
    return function () {
        switch (ui.alert(title, msg, btnset(ui, btns))) {
            case ui.Button.CLOSE:
                return buttons[0];
            case ui.Button.OK:
                return buttons[1];
            case ui.Button.CANCEL:
                return buttons[2];
            case ui.Button.YES:
                return buttons[3];
            case ui.Button.NO:
            default:
                return buttons[4];
        }
    }
}

exports.showSidebarImpl = function (html, ui) {
    return function () {
        ui.showSidebar(html);
        return {};
    }
}
