class StatusHistory < ApplicationRecord
  belongs_to :device
  enum relay1_mode: { manual: 0, auto: 1 }
  enum replay1_status: { off: 0, on: 1 }
  enum relay2_mode: { manual: 0, auto: 1 }
  enum replay2_status: { off: 0, on: 1 }
  enum relay3_mode: { manual: 0, auto: 1 }
  enum replay3_status: { off: 0, on: 1 }
  enum relay4_mode: { manual: 0, auto: 1 }
  enum replay4_status: { off: 0, on: 1 }
end
