class Interaction < ApplicationRecord

  belongs_to :friendship
  belongs_to :mission

  belongs_to :room

  def request?
    self.status == "request"
  end

  def accept?
    self.status == "accept"
  end

  def none?
    self.status == "none"
  end

  def reject?
    self.status == "reject"
  end

end
