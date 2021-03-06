class Student < ApplicationRecord 
   belongs_to :school
   validates_presence_of :name
   validates_presence_of :class_rank 
   validates :honor_roll, inclusion: [true, false]

   def self.sort_by_name 
      order(:name)
   end
end
