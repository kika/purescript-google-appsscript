"use strict";

// module Google.AppsScript.Logger
//

exports.clear= function () {
    Logger.clear();
    return {};
}

exports.getLog = function () {
    return Logger.getLog();
}

exports.log = function ( msg ) {
    return function () {
        Logger.log( msg );
        return {};
    }
}

/* Prints a message and returns a value a Debug.Trace way */
exports.debugImpl = function ( msg ) {
    return function (thunk) {
        Logger.log( msg );
        return thunk({});
    }
}
