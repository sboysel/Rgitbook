library(Rgitbook)
context("openGitbook")

test_that("openGitbook", {
  expect_error(openGitbook(), "Gitbook not found in")
  dir.create("temp")
  newGitbook(dir = "temp")
  buildGitbook(source.dir = "temp", out.dir = "temp")
  expect_true(openGitbook(out.dir = "temp"))
  unlink("temp", recursive = TRUE)
})