-- |
-- Module: Text.Show.Pretty.Colored
-- Copyright: Copyright © 2014 Lars Kuhtz <lakuhtz@gmail.com>
-- License: MIT
-- Maintainer: Lars Kuhtz <lakuhtz@gmail.com>
-- Stability: experimental
--
-- This module combines the pretty-show package and
-- the hscolour package to provide colored pretty-printing
-- in ghci.
--
-- /Usage/
--
-- Add the following lines to your @ghci.conf@ file:
--
-- > -- Pretty printing of it
-- > import Text.Show.Pretty.Colored
-- > :set -interactive-print=Text.Show.Pretty.Colored.cpprint
-- > :def cp (\_ -> return ":set -interactive-print=Text.Show.Pretty.Colored.cpprint")
-- > :def ncp (\_ -> return ":set -interactive-print=print")
--
-- Now you can enable colored pretty-printing in ghci with the commmand
--
-- > :cp
--
-- The following command turns colored pretty-printing off again
--
-- > :ncp
--
module Text.Show.Pretty.Colored
( cpprint
, cpdump
) where

import Text.Show.Pretty
import Language.Haskell.HsColour
import Language.Haskell.HsColour.Colourise
import Language.Haskell.HsColour.Output

cpprint :: Show a => a -> IO ()
cpprint = putStrLn . hscolour (TTYg XTerm256Compatible) defaultColourPrefs False False "" False . ppShow

cpdump :: PrettyVal a => a -> IO ()
cpdump = putStrLn . hscolour (TTYg XTerm256Compatible) defaultColourPrefs False False "" False . dumpStr

