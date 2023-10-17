require(tidyverse)
bookdown::render_book(output_dir = getwd())

dir.create("_main_files")
dir.create("_main_files/figure-html")

file.copy(from = paste0("_bookdown_files/_main_files/figure-html/",dir("_bookdown_files/_main_files/figure-html")),
          to = paste0("_main_files/figure-html/",dir("_bookdown_files/_main_files/figure-html")))


bookdown::render_book()
for(i in dir("_book", pattern="html", full.names=TRUE)) {
  x<-readLines(i)
  writeLines(gsub("_main_files/", "", x), i)
}
