class ChangeColumnNametoClassRank < ActiveRecord::Migration[5.2]
  def change
    remove_column :students, :national_rank
  end
end
