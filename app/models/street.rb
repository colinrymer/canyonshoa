class Street < ActiveRecord::Base
  has_many :lots, inverse_of: :street
end
