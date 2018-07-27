class Portfolio < ApplicationRecord
  include Placeholder

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
    self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
    self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
  end
end
