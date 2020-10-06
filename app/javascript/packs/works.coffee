import { sortable } from "./html.sortable"
ready = undefined
set_positions = undefined

set_positions = -> 
  $(".card").each (i) ->
    $(this).attr 'data-pos', i + 1
    return
  return

ready = ->
  set_positions()
  sortable(".sortable")
  sortable(".sortable")[0].addEventListener 'sortupdate', (e, ui) -> 
    updated_order = []
    set_positions()
    $(".card").each (i) ->
      updated_order.push
        id: $(this).data("id")
        position: i + 1
      return
    $.ajax
      type: "PUT"
      url: "/works/sort"
      data: order: updated_order
    return
  return

$(document).ready ready