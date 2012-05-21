module Main (
    main
) where

import Network.URI
import Network.HTTP

getUri = do
    putStrLn "Enter url to fetch"
    url <- getLine
    let Just uri = parseURI url
    return uri


getPage uri = do
    let req = Request uri GET [] ""
    res <- simpleHTTP req
    let Right rsp = res -- What does Right mean? (non-error?)
    putStrLn  $ rspBody rsp


main = do
    uri <- getUri
    getPage uri