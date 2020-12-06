class Tree < ApplicationRecord
  belongs_to :type
  belongs_to :diameter
  belongs_to :location
end
