module IngreedySpec (main, spec) where

import Test.Hspec
import Ingreedy

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
    describe "parseIngredientAddition" $ do
        it "returns nothing for empty string" $ do
            parseIngredientAddition "" `shouldBe` Nothing

