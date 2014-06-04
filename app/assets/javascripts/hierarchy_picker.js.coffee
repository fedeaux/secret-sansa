class @HierarchyPicker
  constructor: (@args) ->
    @anchor = @args.anchor

  show_hierarchy_picker: () =>
    if @hierarchy_picker
      @hierarchy_picker.show()
    else
      @make_hierarchy_picker()

  hide_hierarchy_picker: () =>
    @hierarchy_picker.hide()

  make_hierarchy_picker: () ->
    hierarchy_picker = ''

    $.ajax {
      url: @picker_url
      async: false
      complete: (response) ->
        hierarchy_picker = response.responseJSON.html
      format: 'json'
    }

    @hierarchy_picker = $ hierarchy_picker
    @hierarchy_picker.addClass(@args.add_class) if @args.add_class?

    @anchor.append @hierarchy_picker

    $('.hierarchy_picker_close', @hierarchy_picker).click @hide_hierarchy_picker

    new HierarchyView '#local_hierarchy_view', {
      hierarchy_view_title_selector: '.local_name'
    }

    $('.picker_item_select').click @select_item
