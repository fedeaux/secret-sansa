@compare_string_as_number = (a, b) ->
  k1 = parseInt a
  k2 = parseInt b
  (k1 > k2) ? 1 : ( (k2 > k1) ? -1 : 0 )

@sort_obj = (obj, cmp) ->
  keys = new Array()
  sorted_obj = {}

  for i, v of obj
    keys.push i

  keys.sort(cmp)

  for i in keys
    sorted_obj[i] = obj[i];

  sorted_obj

@get_current_time = () ->
  d = new Date()
  (d.getHours()-2)+":"+d.getMinutes()

@copy = (obj) ->
  if not is_object obj
    return obj

  if obj instanceof Date
    return new Date(obj.getTime())

  if obj instanceof RegExp
    flags = ''
    flags += 'g' if obj.global?
    flags += 'i' if obj.ignoreCase?
    flags += 'm' if obj.multiline?
    flags += 'y' if obj.sticky?
    return new RegExp(obj.source, flags)

  newInstance = new obj.constructor()

  for key of obj
    newInstance[key] = copy obj[key]

  return newInstance

@intersection = (a, b) ->
  [a, b] = [b, a] if a.length > b.length
  value for value in a when value in b

@extend = (object, properties) ->
  for key, val of properties
    object[key] = val
  object

@merge = (options, overrides) ->
  extend (extend {}, options), overrides

@pad = (num, places, chr = '0') ->
  if num?
    zero = places - num.toString().length + 1
    return (Array(+(zero > 0 && zero)).join(chr) + num)

  chr*places

@looks_like_a_name = (s) ->
  not /[#.+>]/.test s

@mysql_date_string_to_int = (d) ->
  parseInt(d.replace /[\ :-]/g, '')

@mysql_date = (d) ->
  d = new Date() unless d?
  d.getFullYear()+'-'+(d.getMonth()+1)+'-'+d.getDate()

@is_array = (a) ->
  $.isArray a

@is_string = (s) ->
  typeof s == 'string'

@is_function = (s) ->
  typeof s == 'function'

@is_object = (o) ->
  typeof o == 'object'

@is_number = (n) ->
  (typeof n == 'number') and !isNaN(parseFloat(n)) and isFinite(n)

@fill_form_assign = (input, val) ->
  unless input.hasClass 'skip_fill_form_assign'
    type = input.attr 'type'

    if type in ['text', 'password', 'hidden', 'number', 'select'] or ! type?
      input.val val
    else if type == 'radio'
      $('[value="'+val+'"]').click()
    else if type == 'checkbox'
      input.click()
    else
      console.log 'ERROR: Unrecognized input type ', input, input.attr 'type'

    input.change()

@fill_form = (obj, map = {}, _form = '.main_form') ->
  form = $ _form

  for name, val of obj
    if looks_like_a_name name
      input = $ '[name='+name+']', form
    else
      input = $ name, form #tries to use "name" as a selector

    continue if input.length == 0

    fill_form_assign input, val

@replace_last = (subject, search, replace) ->
  _subject = subject.split search

  if _subject.length == 1
    return _subject.join ''

  _subject[0..-2].join(search) + replace + _subject[_subject.length-1]

@format = (subject, _not_null, _null = "") ->
  if subject?
    if is_string _not_null
      return _not_null+subject
    else if is_object _not_null
      return _not_null.before + subject + _not_null.after
    else
      return subject
  else
    return _null

@capitalize = (string) ->
  return string.charAt(0).toUpperCase() + string.slice(1) if string?
  ''

@px_to_unit = (px) ->
  parseInt(px.replace 'px', '')

@unit_to_px = (unit) ->
  parseInt(unit)+'px'

@is_production = () ->
  window.environment.is_production

@get_template_for = (route) ->
  template_path = 'View.'+route.name.replace '/', '.'

  try
    f = eval template_path
    f route.args
  catch
    throw new Error 'Could not find template '+template_path

@ensure = (selector, item) ->
  if item.is selector
    return item
  item.parents(selector)

@base_url = (uri = '') ->
  if Config.production
    return Config.remote_web_service+uri
  return Config.local_web_service+uri

@sort_by_moment = (arr) ->
  arr.sort (a, b) ->
    if a.date.isBefore b.date
      return -1

     if a.date.isAfter b.date
       return 1

     return 0

@unique_id = (length=8) ->
  id = ""
  id += Math.random().toString(36).substr(2) while id.length < length
  id.substr 0, length
