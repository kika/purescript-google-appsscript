module Google.AppsScript.Http
(
    get
  , request
  , Method(..)
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
  , ReqOptions
  , RequestOptions
  , RequestHeaders(..)
  , contentType
  , headers
  , method
  , payload
  , useIntranet
  , validateHttpsCertificates
  , followRedirects
  , muteHttpExtensions
  , escaping
) where

import Prelude

import Data.Maybe
import Data.Function.Uncurried         (Fn2, runFn2)
import Data.Foreign
import Data.Options
import Data.StrMap                     (StrMap)
import Data.Functor.Contravariant      ((>$<))

import Google.AppsScript.AppsScript    (GASEff)
import Google.AppsScript.Blob          (Blob)

foreign import data HTTPResponse :: *
foreign import data Bytes :: *

data Method = GET | DELETE | PATCH | POST | PUT
instance showMethod::Show Method where
  show GET    = "get"
  show DELETE = "delete"
  show PATCH  = "patch"
  show POST   = "post"
  show PUT    = "put"

type Headers = StrMap String
type Cookies = StrMap (Array String)

-- | Type of the request parameters
data RequestOptions
type ReqOptions = Options RequestOptions

-- | Request headers
newtype RequestHeaders = RequestHeaders (StrMap String)

contentType::Option RequestOptions (Maybe String)
contentType = optional $ opt "contentType"

headers::Option RequestOptions (Maybe RequestHeaders)
headers = optional $ opt "headers"

method::Option RequestOptions Method
method = show >$< (opt "method")

payload::Option RequestOptions (Maybe String)
payload = optional $ opt "payload"

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
request url opts = runFn2 requestImpl url $ options opts

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
foreign import requestImpl::Fn2 String Foreign (GASEff HTTPResponse)

