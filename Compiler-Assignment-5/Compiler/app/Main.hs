module Main ( main ) where

import LexCPP
import ParCPP
import PrintCPP
import AbsCPP
import ErrM
import Compiler

import System.IO ( stdin, hGetContents )
import System.Environment ( getArgs, getProgName )
import System.Exit ( exitFailure, exitSuccess )
import Control.Monad ( when )


type ParseFun a = [Token] -> Err a

runFile :: ParseFun Program -> FilePath -> IO ()
runFile p f = putStrLn f >> readFile f >>= run p

run :: ParseFun Program -> String -> IO ()
run p s = let ts = myLexer s in case p ts of
           Bad s    -> do putStrLn "\nParse Failed...\n"
                          putStrLn "Tokens:"
                          putStrLn $ show ts
                          putStrLn s
                          exitFailure
           Ok  tree -> do 
                          let out = compile tree
                          writeFile "a.wat" out
                          exitSuccess

usage :: IO ()
usage = do
  putStrLn $ unlines
    [ "usage: Call with one of the following argument combinations:"
    , "  --help          Display this help message."
    , "  (no arguments)  Parse stdin verbosely."
    , "  (files)         Parse content of files verbosely."
    ]
  exitFailure

main :: IO ()
main = do
  args <- getArgs
  case args of
    ["--help"] -> usage
    [] -> getContents >>= run pProgram
    fs -> mapM_ (runFile pProgram) fs