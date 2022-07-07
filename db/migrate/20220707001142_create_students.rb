class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :name
      t.integer :class_rank
      t.boolean :honor_roll

      t.timestamps
    end
  end
end
