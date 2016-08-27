module Google.AppsScript.Util
(
    encode_b64
  , decode_b64
) where

foreign import encode_b64::String -> String
foreign import decode_b64::String -> String
