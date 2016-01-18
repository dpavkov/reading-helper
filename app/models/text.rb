class Text < ActiveRecord::Base
  attr_accessor :speed, :random_color, :channel, :job_id

  validates :url, presence: true
  validates :speed, presence: true
  validates :random_color, presence: true
end
