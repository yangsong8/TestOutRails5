class Portfolio < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image

  #custom scope 1: only for python as subtitle
  def self.python
    where(subtitle: 'python')  #keep the where queries in the model, and have the controllers to call the functions.
  end

  #custom scope 2: only for ruby as subtitle
  scope :ruby_portfolio_items, -> { where(subtitle: 'ruby') }
end
