Recipe ingredient parser in Haskell

### Prerequisites

You'll need recent versions of GHC and cabal-install (supporting sandboxing).
The easiest way to get these is probably to install the [Haskell Platform][hp]
which installs these and other tools. There are also packages available in most
package managers (including Homebrew).

[hp]: https://www.haskell.org/platform/

### Steps

Create a project sandbox:

```
$ cabal sandbox init
```

Install project dependencies:

```
$ cabal install --dependencies-only --enable-tests -j4
```

*Note:* the `-j4` argument should be the number of cores you wish to use for
compilation.

Run the specs:

```
$ cabal test
```

[parsec]: https://hackage.haskell.org/package/parsec
