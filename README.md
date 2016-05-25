[![Build Status](https://travis-ci.org/larskuhtz/ghci-pretty.svg?branch=master)](https://travis-ci.org/larskuhtz/ghci-pretty)

A tiny package that combines the [ipprint](https://hackage.haskell.org/package/pretty-show)
package and the [hscolour](https://hackage.haskell.org/package/hscolour)
package to provide colored pretty-printing in ghci.

Here is all the code from this package:

```.haskell
module Text.Show.Pretty.Colored
( cpprint
) where

import Text.Show.Pretty
import Language.Haskell.HsColour
import Language.Haskell.HsColour.Colourise
import Language.Haskell.HsColour.Output

cpprint :: Show a => a -> IO ()
cpprint = putStrLn . hscolour (TTYg XTerm256Compatible) defaultColourPrefs False False "" False . ppShow
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
import Text.Show.Pretty.Colored
:set -interactive-print=Text.Show.Pretty.Colored.cpprint
:def cp (\_ -> return ":set -interactive-print=Text.Show.Pretty.Colored.cpprint")
:def ncp (\_ -> return ":set -interactive-print=print")
```

Now you can enable colored pretty-printing in ghci with the commmand

```.haskell
:cp
```

The following command turns colored pretty-printing off again

```.haskell
:ncp
```
