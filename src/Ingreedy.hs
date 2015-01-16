module Ingreedy where

import Text.ParserCombinators.Parsec

import Ingreedy.UnitParser

-- data Amount = Int | Float deriving (Show, Eq, Read)
type Amount = String
type Ingredient = String
data IngredientAddition = IngredientAddition Amount Unit Ingredient deriving (Show, Eq)

parser :: Parser IngredientAddition
parser = do
    amount <- amountParser
    spaces
    unit <- unitParser
    spaces
    ingredient <- ingredientParser
    return $ IngredientAddition amount unit ingredient

integerParser :: Parser String
integerParser = many digit

fractionParser :: Parser String
fractionParser = do
    numerator <- integerParser
    _ <- char '/'
    denominator <- integerParser
    return $ numerator ++ "/" ++ denominator

mixedNumberParser :: Parser String
mixedNumberParser = do
    integer <- integerParser
    spaces
    fraction <- fractionParser
    return $ integer ++ " " ++ fraction

decimalParser :: Parser String
decimalParser = do
    wholeNumber <- integerParser
    _ <- string "."
    decimal <- integerParser
    return $ wholeNumber ++ "." ++ decimal

amountParser :: Parser Amount
amountParser = choice
    [ try decimalParser, try fractionParser, try mixedNumberParser, try integerParser ]

ingredientParser :: Parser Ingredient
ingredientParser = many anyChar

parseIngredientAddition :: String -> Maybe IngredientAddition
parseIngredientAddition input =
    case parse parser "(unknown)" input of
    Left parseError -> Nothing
    Right result -> Just result

