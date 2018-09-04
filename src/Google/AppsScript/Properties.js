"use strict";

exports.getDocProps = function () {
    return PropertiesService.getDocumentProperties();
} // ::GASEff Properties
exports.getScriptProps = function () {
    return PropertiesService.getScriptProperties();
} // ::GASEff Properties
exports.getUserProps = function () {
    return PropertiesService.getUserProperties();
} // ::GASEff Properties

exports.delAll = function (p) {
    return function () {
        return p.deleteAllProperties();
    }
} //::Properties -> GASEff Properties
exports.delImpl = function (key, p) {
    return function () {
        return p.deleteProperty(key);
    }
} //::String -> Properties -> GASEff Properties
exports.keys = function (p) {
    return function () {
        return p.getKeys();
    }
} //::Properties -> GASEff (Array String)
exports.getAll = function (p) {
    return function () {
        return p.getProperties();
    }
} //::Properties -> GASEff Props
exports.getImpl = function (key, p) {
    return function () {
        return p.getProperty(key);
    }
} //::String -> Properties -> GASEff String
exports.setAllImpl = function (props, p) {
    return function () {
        return p.setProperties(props);
    }
} //::Props -> Properties -> GASEff Properties
exports.setImpl = function (key, value, p) {
    return function () {
        return p.setProperty(key, value);
    }
} //::String -> String -> Properties -> GASEff Properties
