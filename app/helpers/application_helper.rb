module ApplicationHelper
  def human_datetime(datetime)
    if datetime.nil?
      return ''
    end

    I18n.l datetime
  end

  def human_date(date)
    if date.nil?
      return ''
    end

    I18n.l date
  end
end
