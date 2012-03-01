module ApplicationHelper

  def record_to_string(record)
    if record == 0
      "More"
    elsif record == 1
      "Less"
    else
      "Crazy"
    end
  end

  def dispute_order(dispute)
    if dispute.record == 0
      'number DESC'
    else
      'number ASC'
    end

  end

end
