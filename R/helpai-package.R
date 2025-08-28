#' 'SciViews::R' - Simplified Help Pages in R Thanks to AI
#'
#' This package builds custom R help pages, based on questions you ask to a LLM
#' (by default, it is Ollama running locally).
#'
#' @section Important functions:
#'
#' - [helpai::ai_ask()] the main function for queries,
#'
#' - [helpai::ai_explain_term()] to get a definition and brief explanation on a
#'    (statistical) term.
#'
#' - [helpai::ai_explain_function()] produces a short help page for an R
#'    function with explanation of its main arguments and a short example.
#'
#' - [helpai::ai_explain_code()] details how a small piece of R code works.
#'
#' - [helpai::ai_explain_error()] explain what en R error message means.
#'
"_PACKAGE"

## usethis namespace: start
#' @importFrom httr2 req_body_json req_headers req_perform request resp_body_json
#' @importFrom roxygen2 roxy_tag tag_markdown
#' @importFrom utils getFromNamespace help
## usethis namespace: end
NULL
