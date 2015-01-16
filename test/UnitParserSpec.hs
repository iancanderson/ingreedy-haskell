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
        it "parses an abbreviated unit" $ do
            parseUnit "lb" `shouldBe` Just Pounds
        it "parses an abbreviated unit with punctuation" $ do
            parseUnit "lb." `shouldBe` Just Pounds
        it "parses a full unit" $ do
            parseUnit "pound" `shouldBe` Just Pounds
        it "parses a plural unit" $ do
            parseUnit "pounds" `shouldBe` Just Pounds
        it "doesn't parse non-units" $ do
            parseUnit "table" `shouldBe` Nothing

