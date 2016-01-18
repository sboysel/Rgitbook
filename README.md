# Gitbook Projects with R Markdown
[![Travis](https://img.shields.io/travis/sboysel/Rgitbook.svg?style=flat-square)](https://travis-ci.org/sboysel/Rgitbook)
[![Codecov](https://img.shields.io/codecov/c/github/sboysel/Rgitbook.svg?style=flat-square)](https://codecov.io/github/sboysel/Rgitbook)

#### Author: Jason Bryer ([jason@bryer.org](mailto:jason@bryer.org))    
#### Website: [jason.bryer.org/Rgitbook](http://jason.bryer.org/Rgitbook)

This page is for an R package used to interface with the [Gitbook.io](http://gitbook.io) framework for developing books using [Markdown](https://daringfireball.net/projects/markdown/). It provides complete access to the Gitbook commands while adding support for [R Markdown](https://www.rstudio.com/ide/docs/r_markdown) and [MathJax](http://www.mathjax.org/). See the [R Gitbook](http://jason.bryer.org/Rgitbook) for a tutorial on how to use this R package.

This R package can be downloaded directly from Github using the `devtools` package:

```
devtools::install_github('sboysel/Rgitbook')
```

#### Updates

* 2014-04-23 - Added support for citations using the `knitcitations` package. The `newGitbook` will create a `references.Rmd` and `references.bib` file.
* 2014-04-23 - Update to support new plugin architecture for using themes in Gitbook.

