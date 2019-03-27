import Test.Hspec
import Language.Java.Parser

import Lib

main :: IO ()
main = hspec spec

spec = do
  describe "generatePlantUml" $ do
    it "can deal with two simple unrelated classes" $ do
      generatePlantUml parseResult `shouldBe` Right "@startuml\n\nclass MyClass {\n}\n\nclass AnotherClass {\n}\n\n@enduml\n"

parseResult = parser compilationUnit "public class MyClass {}; public class AnotherClass {}"

