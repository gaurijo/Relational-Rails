class AddColumntoStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :class_rank, :integer
  end
end
