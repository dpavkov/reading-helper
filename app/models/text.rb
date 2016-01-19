class Text < ActiveRecord::Base
  attr_accessor :speed, :random_color

  validates :url, presence: true
  validates :speed, presence: true
end
