class Report < ActiveRecord::Base

  ALLOWED_SITUATIONS = [
    'good', 
    'warning', 
    'danger', 
    'yes', 
    'no'
  ]

  belongs_to :period
  belongs_to :criteria
  belongs_to :project

  validates_presence_of :period, :criteria, :project, :situation
  validates_inclusion_of :situation, in: ALLOWED_SITUATIONS
end
