class School < ApplicationRecord 
   validates_presence_of :name
   validates_presence_of :national_rank
   validates :ap_program, inclusion: [true, false]
end