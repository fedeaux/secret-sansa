@BestInPlace =
  install: (selector = '.best_in_place') ->
    bip = $ selector
    bip.best_in_place()

    bip.each (i, _e) ->
      e = $ _e
      e.on 'best_in_place:update', BestInPlace.on_change
      BestInPlace.set_bip_placeholder e

  on_change: (e) ->
    BestInPlace.set_bip_placeholder $ e.target

  set_bip_placeholder: (e) ->
    if e.data('nil') == e.text()
      e.addClass 'best_in_place_empty'
    else
      e.removeClass 'best_in_place_empty'
