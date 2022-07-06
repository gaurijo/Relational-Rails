class CreateSchools < ActiveRecord::Migration[5.2]
  def change
    create_table :schools do |t|
      t.string :name
      t.integer :national_rank
      t.boolean :ap_program

      t.timestamps
    end
  end
end
