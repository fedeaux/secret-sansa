@LeadManager =
  setup: () ->
    $('#new_lead_entry').ajaxForm
      success: (data) ->
        $('#load-appendable').prepend data.html
        $('#lead_entry_text').val ''
