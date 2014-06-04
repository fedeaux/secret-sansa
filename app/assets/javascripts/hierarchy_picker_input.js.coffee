class @HierarchyPickerInput extends HierarchyPicker
  constructor: (@args) ->
    super @args
    @input = @args.input
    @picker_url = @input.attr 'data-hierarchy-picker-url'

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
