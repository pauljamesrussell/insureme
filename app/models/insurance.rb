class Insurance < ActiveRecord::Base
  belongs_to :user
  has_many :insurance_details
end
