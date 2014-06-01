$ () ->
  $("form").validationEngine()
  $("#messages").fadeOut 2400

  $('.best_in_place').best_in_place()

  loading_more = $ '#loading-more'

  if loading_more.length > 0
    new InfiniteLoading loading_more

  if $('#lead_entry_text').length > 0
    LeadManager.setup()
