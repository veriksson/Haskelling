module Main (
    main
) where

import Weave (processFile)
import System.Environment (getArgs)


main = do
    args <- getArgs
    case args of 
        [inFile, outFile] -> processFile inFile outFile
        _ -> putStrLn "Needs exactly 2 arguments"
