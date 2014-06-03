class HierarchyPicker
  constructor: (@args) ->
    @input = @args.input
    @anchor = @args.anchor

    @markup_input()
    @event_bindings()

  markup_input: () ->
    @display = $ '<span class="picker_display">
                    <span class="picker_display_placeholder">'+@args.placeholder+'</span>
                    <span class="picker_display_value"></span>
                  </span>'

    @input
      .hide()
      .val('')
      .after @display

  event_bindings: () ->
    @display.click @show_hierarchy_picker
    $(@anchor).on 'click', '#hierarchy_view_picker_wrapper', @hide_hierarchy_picker

  show_hierarchy_picker: () =>
    if @hierarchy_picker
      @hierarchy_picker.show()
    else
      @make_hierarchy_picker()

  hide_hierarchy_picker: () =>
    @hierarchy_picker.hide()

  select_item: (e) =>
    t = $ e.target
    value = t.attr 'data-value'
    display = t.siblings('.picker_display').text()

    @hide_hierarchy_picker()
    @set value, display

  set: (value, display) ->
    @input.val value
    $('.picker_display_value', @display).text display
    $('.picker_display_placeholder', @display).hide()

  make_hierarchy_picker: () ->
    hierarchy_picker = ''

    $.ajax {
      url: @input.attr 'data_hierarchy_picker_url'
      async: false
      complete: (response) ->
        hierarchy_picker = response.responseJSON.html
      format: 'json'
    }

    @hierarchy_picker = $ hierarchy_picker
    @hierarchy_picker.addClass(@args.add_class) if @args.add_class?

    @anchor.append @hierarchy_picker
    @adjust_hierarchy_picker_position()

    new HierarchyView '#category_hierarchy_picker', {
      hierarchy_view_title_selector: '.category_name'
    }

    $('.picker_item_select').click @select_item

  adjust_hierarchy_picker_position: () ->
    #Positioner.set_position @hierarchy_picker, @anchor, ['tl', 'tl']

$ () ->
  $('.local_hierarchy_picker').each (index, element) ->
    j_element = $ element
    new HierarchyPicker { input: j_element, anchor: $('body'), placeholder: j_element.attr 'placeholder' }
