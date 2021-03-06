class Job < ApplicationRecord
  validates :title, presence: true
  validates :wage_upper_bound, presence: true
  validates :wage_lower_bound, presence: true
  validates :wage_lower_bound, numericality: {greater_than:0}
  validates :wage_upper_bound, numericality: {greater_than:0}

  has_many :resumes

  def publish!
    self.hidden = false
    self.save
  end

  def hide!
    self.hidden = true
    self.save
  end

  scope :published, -> {where(hidden: false)}
  scope :recent, -> { order('created_at DESC')}
end
