class Movie < ApplicationRecord
    belongs_to :profile
    validates_presence_of :external_id
end
