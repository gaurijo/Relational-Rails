class AddStudentsToSchools < ActiveRecord::Migration[5.2]
  def change
    add_reference :schools, :student, foreign_key: true
  end
end
