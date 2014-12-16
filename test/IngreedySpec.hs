module IngreedySpec (main, spec) where

import Test.Hspec
import Ingreedy

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
    describe "parseIngredientAddition" $ do
        -- it "returns nothing for empty string" $ do
        --     parseIngredientAddition "" `shouldBe` Left "(unknown)"
        it "parses a simple ingredient addition" $ do
            (parseIngredientAddition "1 lb. potatoes") `shouldBe`
              (Just $ IngredientAddition 1 "lb." "potatoes")
        it "parses a simple ingredient addition" $ do
            (parseIngredientAddition "2 lb. potatoes") `shouldBe`
              (Just $ IngredientAddition 2 "lb." "potatoes")

