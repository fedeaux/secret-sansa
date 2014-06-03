$ () ->
  $("form").validationEngine()
  $("#messages").fadeOut 2400

  loading_more = $ '#loading-more'
  BestInPlace.install()

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
        BestInPlace.install '#local_preview .best_in_place'
