"use strict";

exports.get = function (url) {
  return function () {
    return UrlFetchApp.fetch(url);
  };
} //String -> GASEff HTTPresponse

exports.getHeaders = function (res) {
  return function () {
    var hdrs = res.getAllHeaders();
    for (var k in hdrs) {
      if (typeof hdrs[k] !== 'string') {
        delete hdrs[k];
      };
      return hdrs;
    };
  };
} //HTTPResponse -> GASEff Headers

exports.getCookies = function () {
  return function () {
    var hdrs = res.getAllHeaders();
    var cookies = hdrs['set-cookie'] || hdrs['Set-Cookie'];
    return cookies || [];
  };
} //HTTPResponse -> GASEff Cookies

exports.getBlob = function (res) {
  return function () {
    return res.getBlob();
  }
} //HTTPResponse -> GASEff Blob

exports.getContent = function (res) {
  return function () {
    return res.getContent();
  }
} //HTTPResponse -> GASEff Bytes

exports.getContentText = function (res) {
  return function () {
    return res.getContentText();
  }
} //HTTPResponse -> GASEff String

exports.getResponseCode = function (res) {
  return function () {
    return res.getResponseCode();
  }
} //HTTPResponse -> GASEff Int

exports.getContentTextAsImpl = function (charset, res) {
  return function () {
    return res.getContentText(charset);
  }
} //Fn2 String HTTPResponse (GASEff String)

exports.getAsImpl = function (ctype, res) {
  return function () {
    return res.getAs(ctype);
  }
} //Fn2 String HTTPResponse (GASEff Blob)

exports.requestImpl = function (url, params) {
  return function () {
    return UrlFetchApp.fetch(url, params);
  }
} //Fn2 String ReqOptions (GASEff HTTPResponse)

