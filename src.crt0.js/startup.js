// Google Apps Script startup module
// Puts event hooks into global namespce and calls application callbacks
//

function onOpen (e) {
    PS["Main"].onOpen(e)();
}

function onInstall (e) {
    PS["Main"].onInstall(e)();
}

function onEdit (e) {
    PS["Main"].onEdit(e)();
}
