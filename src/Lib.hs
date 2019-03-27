module Lib
    ( generatePlantUml
    ) where

import Language.Java.Parser
import Language.Java.Syntax
import Text.Parsec.Error

type PlantUml = String

generatePlantUml :: Either ParseError CompilationUnit -> Either ParseError PlantUml
generatePlantUml parseResult = fmap generatePlantUml' parseResult

generatePlantUml' :: CompilationUnit -> PlantUml
generatePlantUml' (CompilationUnit _ _ typeDeclarations) = "@startuml\n\n" ++ classUml ++ "@enduml\n"
  where
    classUml = unlines $ fmap getClassUml typeDeclarations
    getClassUml (ClassTypeDecl (ClassDecl _ (Ident name) _ _ _ _)) = plantUmlify name
    plantUmlify name = "class " ++ name ++ " {\n}\n"

