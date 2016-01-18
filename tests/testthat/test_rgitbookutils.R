library(Rgitbook)
context("Rgitbook utils")

test_that("checkForGitbook sends appropriate messages", {
  expect_silent(checkForGitbook(quiet = TRUE))
  expect_message(checkForGitbook())
  expect_true(checkForGitbook())
})

test_that("gitbookInfo sends appropriate messages", {
  expect_message(gitbookInfo())
})