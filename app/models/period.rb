class Period < ActiveRecord::Base
  has_many :statuses
  validates_presence_of :starts_at, :ends_at
end
