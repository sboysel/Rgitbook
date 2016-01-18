library(Rgitbook)
context("buildGitbook")

test_that("successful buildGitbook", {
  src.dir <- dir.create("temp_src")
  out.dir <- dir.create("temp_out")
  newGitbook(dir = "temp_src")
  expect_message(buildGitbook(source.dir = "temp_src",
                              out.dir = "temp_out"),
                 "R Markdown files successfully built!")
  unlink("temp_src", recursive = TRUE)
  unlink("temp_out", recursive = TRUE)
})