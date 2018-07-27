class Portfolio < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image

  #custom scope 1: only for python as subtitle
  def self.python
    where(subtitle: 'python')  #keep the where queries in the model, and have the controllers to call the functions.
  end

  #custom scope 2: only for ruby as subtitle
  scope :ruby_portfolio_items, -> { where(subtitle: 'ruby') }

  after_initialize :set_defaults

  # the default values till be added after the new controller action is called.
  # the place holder images will be populated to the portfolio/new page
  def set_defaults
    self.main_image ||= "http://via.placeholder.com/600x400"
    self.thumb_image ||= "http://via.placeholder.com/350x200"
  end
end
