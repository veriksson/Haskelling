{- This is a Haskell version of Samuel A. Falvos weave.fs -}
module Weave (
    processFile
) where

import Data.List (isPrefixOf)


italicWord :: String -> String
italicWord word = "<i>" ++ word ++ "</i>"

boldWord :: String -> String
boldWord word = "<b>" ++ word ++ "</b>"

processToken :: String -> String -> String
processToken token nextToken = 
    case fixedToken of
        "iw" -> italicWord nextToken
        "bw" -> boldWord nextToken
        _    -> nextToken
    where fixedToken = drop 1 token


processWords :: [String] -> [String]
processWords [] = []
processWords (token:[]) = [token]
processWords (token:nextToken:rest)
    | "~" `isPrefixOf` token = (processToken token nextToken) : processWords rest
    | otherwise              = token : (processWords $ nextToken : rest)


processFile :: String -> String -> IO ()
processFile inFile outFile = do
        input <- readFile inFile
        let contents = words input
        writeFile outFile  $ unwords (processWords contents)

