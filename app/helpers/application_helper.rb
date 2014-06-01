module ApplicationHelper
  def human_datetime(datetime)
    if datetime.nil?
      return ''
    end

    I18n.l datetime
  end
end
