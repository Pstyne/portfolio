import { sortable } from "./html.sortable"
ready = undefined

ready = ->
  sortable(".sortable")
  return

$(document).ready ready