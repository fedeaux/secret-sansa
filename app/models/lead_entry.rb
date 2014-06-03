class LeadEntry < ActiveRecord::Base
  belongs_to :lead
  default_scope order: 'created_at DESC'

  after_save :update_lead

  private
  def update_lead
  end

end
