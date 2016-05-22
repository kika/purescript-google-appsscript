"use strict";

// module Google.AppsScript.Logger
//

exports.clearImpl = function () {
    return function() {
        Logger.clear();
        return {};
    }
}

exports.getLogImpl = function () {
    return function() {
        return Logger.getLog();
    }
}

exports.logImpl = function ( msg ) {
    return function () {
        Logger.log( msg );
        return {};
    }
}
