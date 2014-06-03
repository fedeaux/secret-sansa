class @InfiniteLoading
  constructor: (@load_more) ->
    @loading = false

    @counter = $ '#loading-more-counter'
    @interface = $ '#loading-more-interface'
    @container = $ '#load-appendable'

    try
      @data = JSON.parse @container.attr 'data-loading'

    catch e
      @data = {}


    $('.loading, .full', @interface).hide()

    @counter.val 0
    @url = @load_more.attr 'data-url'

    @bind_events()

  bind_events: () ->
    $(window).scroll () =>
      if $(window).scrollTop() == $(document).height() - $(window).height()
        @more()

  more: () =>
    unless @loading
      $('.idle, .full', @interface).hide()
      $('.loading', @interface).show()

      next_page = 1 + parseInt @counter.val()
      @counter.val next_page
      @loading = true
      @data.page = next_page

      $.get @url, @data, @loading_done


  loading_done: (data) =>
    if data.amount > 0
      @container.append data.html
      $('.loading, .full', @interface).hide()
      $('.idle', @interface).show()
    else
      $('.loading, .idle', @interface).hide()
      $('.full', @interface).show()

    @loading = false
