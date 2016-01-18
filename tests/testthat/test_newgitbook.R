library(Rgitbook)
context("newGitbook")

test_that("newGitbook", {
  expect_error(newGitbook(), "dir parameter is required.")
  expect_message(newGitbook(dir = tempdir()), ".bookignore")
  expect_message(newGitbook(dir = tempdir()), ".gitignore")
  expect_message(newGitbook(dir = tempdir()), "README.md")
  expect_message(newGitbook(dir = tempdir()), "SUMMARY.md")
  expect_message(newGitbook(dir = tempdir()), "REFERENCES.Rmd")
  temp_files <- c(".bookignore", ".gitignore", "references.bib", "README.md",
                  "SUMMARY.md", "REFERENCES.Rmd")
  newGitbook(dir = getwd(), example_sections = FALSE)
  expect_true(all(file.exists(temp_files)))
  file.remove(temp_files)
})