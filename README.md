# lex

The goal of the package is to provide an easy way for the user to determine if
the values were already transformed (exponentiated or logharitmized).

One can install it with the following commands:
```r
# install.packages(devtools)
devtools::install_github("krzyslom/lex")
```

## Motivation

Sometimes in a long and complicated data processing workflow one could lose
track if the current values are in their exponentiated or logharitmized state.
Not always creating a new variable with `exp_` or `log_` prefix is a desirable
option. Functions `exp` and `log` mask the ones from `base` package and provide
new classes that help determine current values' state.
