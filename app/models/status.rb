class Status < ApplicationRecord
  belongs_to :device
  # enum relay1_mode: { manual: false, auto: true }
  # enum relay1_status: { off: false, on: true }
  # enum relay2_mode: { manual2: false, auto2: true }
  # enum relay2_status: { off: false, on: true }
  # enum relay3_mode: { manual: false, auto: true }
  # enum relay3_status: { off: false, on: true }
  # enum relay4_mode: { manual: false, auto: true }
  # enum relay4_status: { off: false, on: true }
end
