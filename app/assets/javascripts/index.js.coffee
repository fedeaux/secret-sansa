$ () ->
  $("form").validationEngine()
  $("#messages").fadeOut 2400

  bip = $ '.best_in_place'
  bip.best_in_place()

  set_bip_placeholder = (e) ->
    if e.data('nil') == e.text()
      e.addClass 'best_in_place_empty'
    else
      e.removeClass 'best_in_place_empty'

  bip.each (i, _e) ->
    e = $ _e
    set_bip_placeholder e
    e.on 'ajax:complete', set_bip_placeholder

  loading_more = $ '#loading-more'

  if loading_more.length > 0
    new InfiniteLoading loading_more

  if $('#lead_entry_text').length > 0
    LeadManager.setup()

  if $('.hierarchy_view').length > 0
    new HierarchyView '.hierarchy_view', {hierarchy_view_title_selector: '.local_name'}

    $('li').click (e) ->
      t = ensure 'li', $ e.target
      url = t.attr 'data-preview-url'
      $.get url, (data) ->
        $('#local_preview').html data.html
