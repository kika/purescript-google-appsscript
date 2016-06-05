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

exports.delAll = function (p) {
    function () {
        return p.deleteAllProperties();
    }
} //::Properties -> GASEff Properties
exports.del = function (key, p) {
    function () {
        return p.deleteProperty(key);
    }
} //::String -> Properties -> GASEff Properties
exports.keys = function (p) {
    function () {
        return p.getKeys();
    }
} //::Properties -> GASEff (Array String)
exports.getAll = function (p) {
    function () {
        return p.getProperties();
    }
} //::Properties -> GASEff Props 
exports.get = function (key, p) {
    function () {
        return p.getProperty(key);
    }
} //::String -> Properties -> GASEff String
exports.setAll = function (props, p) {
    function () {
        return p.setProperties(props);
    }
} //::Props -> Properties -> GASEff Properties 
exports.set = function (key, value, p) {
    function () {
        return p.setProperty(key, value);
    }
} //::String -> String -> Properties -> GASEff Properties
