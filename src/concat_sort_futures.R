# Script to sort two tibble columns, concat them, using R futures
#' @pieterhuy

# load env ----------------------------------------------------------------


library(dplyr)


# install furr if required
if(!require(furrr)){install.packages("furrr")}

# load furr, which is purrr but with futures
library(furrr)

# declare future plan -----------------------------------------------------


# set multisession plan, 6 parallel sessions,
plan("multisession",workers = 6)

# concat and sort ---------------------------------------------------------

tibble(from = c("a", "b"), to = c("b", "a")) %>%
  mutate( con_sort = 
    furrr::future_map2_chr(from,to, function(x, y) {
    paste(
      sort(c(x, y)),
      collapse = ""
      )
      }
    )
  )

