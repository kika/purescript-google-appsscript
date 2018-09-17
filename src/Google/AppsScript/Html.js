// module Google.AppsScript.Html
//
"use strict";

exports.html = function () {
    return HtmlService;
}

exports.createHtmlOutputFromFileImpl = function (file, html) {
    return function () {
        return html.createHtmlOutputFromFile(file);
    }
}

exports.setTitleImpl = function (title, html) {
    return function () {
        return html.setTitle(title);
    }
}

exports.setWidthImpl = function (width, html) {
    return function () {
        return html.setWidth(width);
    }
}

exports.setHeightImpl = function (width, html) {
    return function () {
        return html.setHeight(width);
    }
}

exports.setSandboxMode = function (html) {
    return function() {
        html.setSandboxMode( HtmlService.SandboxMode.IFRAME );
        return html;
    }
}
