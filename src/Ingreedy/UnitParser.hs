module Ingreedy.UnitParser where

import Text.ParserCombinators.Parsec

data Unit = Pounds deriving (Eq, Show)

poundsParser :: Parser Unit
poundsParser = do
  _ <- parseAny ["lb.", "lb", "pounds", "pound"]
  return $ Pounds

parseAny xs = choice $ map (\x -> try $ string x) xs

unitParser :: Parser Unit
unitParser = poundsParser

