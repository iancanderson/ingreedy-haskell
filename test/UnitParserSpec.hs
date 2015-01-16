module UnitParserSpec (main, spec) where

import Test.Hspec
import Ingreedy.UnitParser

import Text.ParserCombinators.Parsec

main :: IO ()
main = hspec spec

parseUnit :: String -> Unit
parseUnit input =
    case parse unitParser "(unknown)" input of
    Left _ -> "failed"
    Right result -> result

spec :: Spec
spec = do
    describe "unitParser" $ do
      it "parses an abbreviated unit" $ do
          parseUnit "lb" `shouldBe` "lb"
      it "parses an abbreviated unit with punctuation" $ do
          parseUnit "lb." `shouldBe` "lb."
      it "parses a full unit" $ do
          parseUnit "pound" `shouldBe` "pound"
      it "parses a plural unit" $ do
          parseUnit "pounds" `shouldBe` "pounds"
      it "doesn't parse non-units" $ do
          parseUnit "table" `shouldBe` "failed"

