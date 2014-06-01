class Lead < ActiveRecord::Base
  has_many :lead_entries
  default_scope order: 'subject ASC'

end
