class Client < ActiveRecord::Base
  has_one :local

  validates :name, :email, presence: true
  validates_format_of :email,:with => Devise::email_regexp
  default_scope order: 'name ASC'

  def local
    return nil unless self.local_id
    Local.find self.local_id
  end

end
