library(Rgitbook)
context("newPage")

test_that("newPage makes the correct file", {
  newPage(filename = "test", title = "MyTitle")
  expect_true("test.Rmd" %in% dir())
  conn <- file("test.Rmd")
  lines <-readLines(conn)
  close(conn)
  expect_true(any(grepl("# MyTitle", lines)))
  expect_true(file.remove("test.Rmd"))
  expect_message(newPage(), "newpage.Rmd created")
  expect_true(file.remove("newpage.Rmd"))
})