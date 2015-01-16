module UnitParserSpec (main, spec) where

import Test.Hspec
import Ingreedy.UnitParser

import Text.ParserCombinators.Parsec

main :: IO ()
main = hspec spec

parseUnit :: String -> Maybe Unit
parseUnit input =
    case parse unitParser "(unknown)" input of
    Left _ -> Nothing
    Right result -> Just result

spec :: Spec
spec = do
    describe "unitParser" $ do
        it "parses ounces" $ do
            parseUnit "ounces" `shouldBe` Just Ounces
            parseUnit "ounce" `shouldBe` Just Ounces
            parseUnit "oz" `shouldBe` Just Ounces
        it "parses pounds" $ do
            parseUnit "lb" `shouldBe` Just Pounds
            parseUnit "lb." `shouldBe` Just Pounds
            parseUnit "pound" `shouldBe` Just Pounds
            parseUnit "pounds" `shouldBe` Just Pounds
        it "doesn't parse non-units" $ do
            parseUnit "table" `shouldBe` Nothing
            parseUnit "ouncessss" `shouldBe` Nothing
