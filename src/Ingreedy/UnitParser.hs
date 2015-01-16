module Ingreedy.UnitParser where

import Text.ParserCombinators.Parsec

data Unit = Ounces | Pounds deriving (Eq, Show)

poundsParser :: Parser Unit
poundsParser = do
  _ <- parseAny ["pounds", "pound", "lb.", "lb"]
  return $ Pounds

ouncesParser :: Parser Unit
ouncesParser = do
  _ <- parseAny ["ounce", "oz"]
  return $ Ounces

parseAny xs = choice $ map (\x -> try $ string x) xs

unitParser :: Parser Unit
unitParser = choice [ouncesParser, poundsParser]

