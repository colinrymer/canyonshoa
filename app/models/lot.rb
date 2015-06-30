class Lot < ActiveRecord::Base
  belongs_to :street, inverse_of: :lots
  has_many :users, inverse_of: :lot

  scope :sorted, -> { includes(:street).order("streets.name asc").order(number: :asc) }

  def mailing_address
    "#{number} #{street.name}"
  end
end
