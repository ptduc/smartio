class Device < ApplicationRecord
  belongs_to :unit
  has_one :status
  has_many :status_histories
end
