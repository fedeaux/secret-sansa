class @HierarchyPickerInPlaceEdit extends HierarchyPicker
  constructor: (@args) ->
    super @args
    @field = @args.field
    @picker_url = @field.attr 'data-hierarchy-picker-url'
    @push_url = @field.attr 'data-hierarchy-picker-push-url'

    @event_bindings()

  event_bindings: () ->
    @field.click @show_hierarchy_picker

  select_item: (e) =>
    t = $ e.target
    value = t.attr 'data-value'

    $.ajax {
      method: 'post'
      url: @push_url
      data:
        '_method': 'put'
        'client[local_id]': value
        'authenticity_token': AUTH_TOKEN

      complete: (response) =>
        window.location.reload()
        # new_field = $ '#'+@field.attr('id'), response.html
        # @field.html new_field.html()
        # console.log new_field.html()
        # @hide_hierarchy_picker()

      format: 'json'
    }
