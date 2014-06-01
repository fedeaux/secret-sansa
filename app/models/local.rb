class Local < ActiveRecord::Base
  has_ancestry
  validates :name, presence: true
  default_scope order: 'name ASC'
end
