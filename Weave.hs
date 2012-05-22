{- This is a Haskell version of Samuel A. Falvos weave.fs -}
module Weave (
    processWords
) where

import Data.List (isPrefixOf)

--let s = "This is a test string"
--let ws = words s
{- Todo: Actually process token 
case fixedToken of
    "iw" -> italicWord nextToken
    "bw" -> boldWord nextToken
where fixedToken = drop 1 token
-}
processToken :: String -> String -> String
processToken token nextToken = nextToken

processWords :: [String] -> [String]
processWords []     = []
processWords (token:nextToken:rest)
    | "~" `isPrefixOf` token        = processToken token nextToken : processWords rest
    | otherwise                     = [token] ++ (processWords $ [nextToken] ++ rest) ++ []