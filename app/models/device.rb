class Device < ApplicationRecord
  belongs_to :unit
  has_many :statuses
  has_many :status_histories
end
