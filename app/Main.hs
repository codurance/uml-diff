module Main where

import Language.Java.Parser

import Lib

main :: IO ()
main = do
  let plantUml = generatePlantUml $ parser compilationUnit "public class MyClass {}; public class AnotherClass {}"
  case plantUml of (Left _) -> putStrLn "failed to parse the java code"
                   (Right output) -> writeFile "output.plantuml" output >> putStrLn "plantuml generated at output.plantuml"

