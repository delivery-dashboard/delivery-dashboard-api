class Period < ActiveRecord::Base
  has_many :reports
  validates_presence_of :starts_at, :ends_at
end
