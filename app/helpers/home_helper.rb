module HomeHelper
  def get_mode mode
    case mode
    when 0
      "Turn ON"
    when 1
      "Turn OFF"
    when 2
      "Auto"
    when 3
      "Scheduler"
    else
      "Turn OFF"
    end
  end
end
