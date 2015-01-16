module Ingreedy.UnitParser where

import Text.ParserCombinators.Parsec

type Unit = String

poundsParser :: Parser String
poundsParser = parseAny ["lb.", "lb", "pound"]

parseAny xs = choice $ map (\x -> try $ string x) xs

unitParser :: Parser Unit
unitParser = poundsParser

