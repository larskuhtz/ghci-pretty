[![Build Status](https://travis-ci.org/larskuhtz/ghci-pretty.svg?branch=master)](https://travis-ci.org/larskuhtz/ghci-pretty)

A tiny hack for colored pretty printing in ghci.

This is the only real code in this package:

```.haskell
module IPPrint.Colored
( cpprint
) where

import IPPrint
import Language.Haskell.HsColour
import Language.Haskell.HsColour.Colourise
import Language.Haskell.HsColour.Output

cpprint :: Show a => a -> IO ()
cpprint = putStrLn . hscolour (TTYg XTerm256Compatible) defaultColourPrefs False False "" False . pshow
```

Usage
=====

```.haskell
cabal update
cabal install ghci-pretty
```

Add the following lines to your `ghci.conf` file:

```.haskell
-- Pretty printing of it
import IPPrint.Colored
:set -interactive-print=IPPrint.Colored.cpprint
:def cp (\_ -> return ":set -interactive-print=IPPrint.Colored.cpprint")
```

Now you can enable colored pretty-printing in ghci with the commmand

```.haskell
:cp
```

