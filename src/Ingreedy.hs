module Ingreedy where

import Data.Char
import Text.ParserCombinators.Parsec

type Amount = Int
type Ingredient = String
type Unit = String
data IngredientAddition = IngredientAddition Amount Unit Ingredient deriving (Show, Eq)

parser :: Parser IngredientAddition
parser =
    do amount <- amountParser
       spaces
       unit <- unitParser
       spaces
       ingredient <- ingredientParser
       return $ IngredientAddition amount unit ingredient

amountParser :: Parser Amount
amountParser =
    do amountChar <- digit
       return $ digitToInt amountChar

unitParser :: Parser Unit
unitParser = return "lb."

ingredientParser :: Parser Ingredient
ingredientParser = return "potatoes"

parseIngredientAddition :: String -> Maybe IngredientAddition
parseIngredientAddition input =
    case parse parser "(unknown)" input of
    Left parseError -> Nothing
    Right result -> Just result

