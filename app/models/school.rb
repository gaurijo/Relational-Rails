class School < ApplicationRecord
   has_many :students 
   validates_presence_of :name
   validates_presence_of :national_rank
   validates :ap_program, inclusion: [true, false]

   # scope :order_by_created_at, -> { order(created_at: :desc) }
   def self.sort_by_created_at 
      order(created_at: :desc)
   end

   def student_count
      self.students.count
   end
end