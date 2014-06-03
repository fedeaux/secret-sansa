# You must add this to your css file
#    @selector li ul { display: none; }

class @HierarchyView
  constructor: (@selector, @args = {}) ->
    defaults =
      hide_time: 200
      show_time: 200
      hierarchy_view_title_selector: 'a'

    for name, value of defaults
      @args[name] ?= value

    @list = $ @selector
    $(@args.hierarchy_view_title_selector, @list).click @toogle_sub_list

  toogle_sub_list: (event) =>
    t = $ event.target

    unless t.is @args.hierarchy_view_title_selector
      t = t.parents @args.hierarchy_view_title_selector

    sub_list = t.siblings 'ul'

    if sub_list.is ":visible"
      sub_list.hide @args.hide_time
      t.removeClass 'hierarchy_view_open'

    else
      sub_list.show @args.show_time
      t.addClass 'hierarchy_view_open'
