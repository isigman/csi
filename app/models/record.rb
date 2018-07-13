class Record < ApplicationRecord
  belongs_to :corp, optional: true
end
