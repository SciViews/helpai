# Code copied from svMisc, to avoid a dependency!
.TempEnv_ <- function() {
  srch <- search()
  pos <-  match("SciViews:TempEnv", srch)
  if (is.na(pos)) {# Must create it
    pos <- length(srch) - 1
    `SciViews:TempEnv` <- list()
    Attach <- function(...) get("attach", mode = "function")(...)
    Attach(`SciViews:TempEnv`, pos = pos)
  }
  pos.to.env(pos)
}

.assign_temp <- function(x, value, replace.existing = TRUE) {
  TempEnv <- .TempEnv_()
  if (isTRUE(replace.existing) || !exists(x, envir = TempEnv, mode = "any",
    inherits = FALSE)) {
    assign(x, value, envir = TempEnv)
  }
}

.get_temp <- function(x, default = NULL, mode = "any", item = NULL) {
  if (is.null(item)) Mode <- mode else Mode <- "any"

  t_env <- .TempEnv_()
  if  (exists(x, envir = t_env, mode = Mode, inherits = FALSE)) {
    dat <- get(x, envir = t_env, mode = Mode, inherits = FALSE)
    if (is.null(item)) {
      return(dat)
    } else {
      item <- as.character(item)[1]
      if (inherits(dat, "list") && item %in% names(dat)) {
        dat <- dat[[item]]
        if (mode != "any" && mode(dat) != mode) dat <- default
        return(dat)
      } else {
        return(default)
      }
    }
  } else {# Variable not found, return the default value
    default
  }
}
