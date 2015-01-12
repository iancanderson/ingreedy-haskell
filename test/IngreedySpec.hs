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
              (Just $ IngredientAddition "1" "lb." "potatoes")
        it "doesn't require spaces between amount and unit" $ do
            (parseIngredientAddition "12oz potatoes") `shouldBe`
              (Just $ IngredientAddition "12" "oz" "potatoes")
        it "parses a simple ingredient addition" $ do
            (parseIngredientAddition "2 lb. potatoes") `shouldBe`
              (Just $ IngredientAddition "2" "lb." "potatoes")
        it "parses multi-word ingredients" $ do
            (parseIngredientAddition "2 lb. parmesan cheese") `shouldBe`
              (Just $ IngredientAddition "2" "lb." "parmesan cheese")
        it "parses multidigit amounts" $ do
            (parseIngredientAddition "22 lb. parmesan cheese") `shouldBe`
              (Just $ IngredientAddition "22" "lb." "parmesan cheese")
        it "parses decimal amounts" $ do
            (parseIngredientAddition "22.2 lb. parmesan cheese") `shouldBe`
              (Just $ IngredientAddition "22.2" "lb." "parmesan cheese")
        it "parses fractional amounts" $ do
            (parseIngredientAddition "1/2 lb. parmesan cheese") `shouldBe`
              (Just $ IngredientAddition "1/2" "lb." "parmesan cheese")
        it "parses complex fractional amounts" $ do
            (parseIngredientAddition "1 1/2 lb. parmesan cheese") `shouldBe`
              (Just $ IngredientAddition "1 1/2" "lb." "parmesan cheese")
