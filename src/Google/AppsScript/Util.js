"use strict";

exports.encode_b64 = function (str) {
  return Utilities.base64Encode(Utilities.newBlob(str).getBytes());
}

exports.decode_b64 = function (data) {
  return Utilities.newBlob(Utilities.base64Decode(data)).getDataAsString();
}
