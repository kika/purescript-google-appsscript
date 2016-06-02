// module Google.AppsScript.Properties
"use strict";

exports.getDocProps = function () {
    function () {
        return PropertiesService.getDocumentProperties();
    }
} // ::GASEff Properties
exports.getScriptProps = function () {
    function () {
        return PropertiesService.getScriptProperties();
    }
} // ::GASEff Properties
exports.getUserProps = function () {
    function () {
        return PropertiesService.getUserProperties();
    }
} // ::GASEff Properties

