class Client < ActiveRecord::Base
  validates :name, :email, presence: true
  validates_format_of :email,:with => Devise::email_regexp
  default_scope order: 'name ASC'
end
