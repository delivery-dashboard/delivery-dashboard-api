class Status < ActiveRecord::Base

  ALLOWED_STATUSES = [
    'good', 
    'warning', 
    'danger', 
    'yes', 
    'no'
  ]

  belongs_to :period
  belongs_to :criteria
  belongs_to :project

  validates_presence_of :period, :criteria, :project, :status
  validates_inclusion_of :status, in: ALLOWED_STATUSES
end
