module Main where

import System.Directory
import Control.Concurrent.ParallelIO.Global
import Language.Java.Parser

import Lib

main :: IO ()
main = do
  javaFileNames <- listDirectory "javaTestFiles"
  let javaFilePaths = fmap ("javaTestFiles/" ++) javaFileNames
  javaFileContents <- parallel (fmap readFile javaFilePaths)
  let javaCode = unlines javaFileContents
  let ast = parser compilationUnit javaCode
  let plantUml = generatePlantUml ast
  case plantUml of (Left _) -> putStrLn "failed to parse the java code"
                   (Right output) -> writeFile "output.plantuml" output >> putStrLn "plantuml generated at output.plantuml"
  stopGlobalPool

