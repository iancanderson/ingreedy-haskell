module Ingreedy.UnitParser where

import Text.ParserCombinators.Parsec

type Unit = String

poundsParser :: Parser String
poundsParser = choice
    [ try $ string "lb.", try $ string "pound" ]

unitParser :: Parser Unit
unitParser = poundsParser

