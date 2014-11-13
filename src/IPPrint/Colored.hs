-- ------------------------------------------------------ --
-- Copyright © 2014 Lars Kuhtz <lakuhtz@gmail.com>
-- ------------------------------------------------------ --

module IPPrint.Colored
( cpprint
) where

import IPPrint
import Language.Haskell.HsColour
import Language.Haskell.HsColour.Colourise
import Language.Haskell.HsColour.Output

cpprint :: Show a => a -> IO ()
cpprint = putStrLn . hscolour (TTYg XTerm256Compatible) defaultColourPrefs False False "" False . pshow

