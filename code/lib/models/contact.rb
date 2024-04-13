require 'mongoid'

class Contact
  include Mongoid::Document

  field :name, type: String
  field :phone, type: String

  validates :name, presence: true
  validates :phone, presence: true
end
