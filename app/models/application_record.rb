class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  #validates :message, :url, presence: true
end
