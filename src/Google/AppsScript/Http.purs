module Google.AppsScript.Http
(
    get
  , request
  , HTTPResponse
  , getHeaders
  , getCookies
  , getAs
  , getBlob
  , getContent
  , getContentText
  , getContentTextAs
  , getResponseCode
  , Bytes
  , Cookies
  , Headers
  , RequestOptions
) where

import Data.Function.Uncurried         (Fn2, runFn2)
import Data.Options
import Data.StrMap                     (StrMap)

import Google.AppsScript.AppsScript    (GASEff)
import Google.AppsScript.Blob          (Blob)

foreign import data HTTPResponse :: *
foreign import data Bytes :: *


type Headers = StrMap String
type Cookies = StrMap (Array String)

-- | Type of the request parameters
data RequestOptions
type ReqOptions = Options RequestOptions

-- | Request headers
newtype RequestHeaders = RequestHeaders (StrMap String)

contentType::Option RequestOptions String
contentType = opt "contentType"

headers::Option RequestOptions RequestHeaders
headers = opt "headers"

payload::Option RequestOptions String
payload = opt "payload"

useIntranet::Option RequestOptions Boolean
useIntranet = opt "useIntranet"

validateHttpsCertificates::Option RequestOptions Boolean
validateHttpsCertificates = opt "validateHttpsCertificates"

followRedirects::Option RequestOptions Boolean
followRedirects = opt "followRedirects"

muteHttpExtensions::Option RequestOptions Boolean
muteHttpExtensions = opt "muteHttpExtensions"

escaping::Option RequestOptions Boolean
escaping = opt "escaping"

-- UrlFetchApp
foreign import get::String -> GASEff HTTPResponse
request::String -> ReqOptions -> GASEff HTTPResponse
request url opts = runFn2 requestImpl url opts

-- HTTPResponse
foreign import getHeaders::HTTPResponse -> GASEff Headers
foreign import getCookies::HTTPResponse -> GASEff Cookies
getAs::String -> HTTPResponse -> GASEff Blob
getAs ctype res = runFn2 getAsImpl ctype res
foreign import getBlob::HTTPResponse -> GASEff Blob
foreign import getContent::HTTPResponse -> GASEff Bytes
foreign import getContentText::HTTPResponse -> GASEff String
getContentTextAs::String -> HTTPResponse -> GASEff String
getContentTextAs cset res = runFn2 getContentTextAsImpl cset res
foreign import getResponseCode::HTTPResponse -> GASEff Int

foreign import getContentTextAsImpl::Fn2 String HTTPResponse (GASEff String)
foreign import getAsImpl::Fn2 String HTTPResponse (GASEff Blob)
foreign import requestImpl::Fn2 String ReqOptions (GASEff HTTPResponse)

