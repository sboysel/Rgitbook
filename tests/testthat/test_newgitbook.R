library(Rgitbook)
context("newGitbook")

test_that("newGitbook generates proper errors, messages, and files", {
  temp_files <- c(".bookignore", ".gitignore", "references.bib", "README.md",
                  "SUMMARY.md", "REFERENCES.Rmd")
  newGitbook(dir = getwd(), example_sections = FALSE)
  expect_true(all(file.exists(temp_files)))
  file.remove(temp_files)
})