{- This is a Haskell version of Samuel A. Falvos weave.fs -}
module Weave (
    processWords
) where

import Data.List (isPrefixOf)

{- Todo: Actually process token 
case fixedToken of
    "iw" -> italicWord nextToken
    "bw" -> boldWord nextToken
where fixedToken = drop 1 token
-}
processToken :: String -> String -> String
processToken token nextToken = nextToken

processWords :: [String] -> [String]
processWords [] = []
processWords ws
    | "~" `isPrefixOf` token        = processToken token nextToken : []
    | otherwise                     = (processWords $ drop 1 ws)  ++ []
    where token = head ws
          nextToken = ws !! 1