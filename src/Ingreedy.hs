module Ingreedy where

import Data.List
import Data.Maybe

type IngredientAddition = String

parseIngredientAddition :: String -> Maybe IngredientAddition
parseIngredientAddition "" = Nothing
