class AssocitateDaterBackersWithTables < ActiveRecord::Migration[5.1]
  def change
    remove_column :backer_evals, :dater_id, :integer
    remove_column :backer_evals, :backer_id, :integer
    add_reference :backer_evals, :dater_backer, index: true

    remove_column :comments, :dater_id, :integer
    remove_column :comments, :backer_id, :integer
    add_reference :comments, :dater_backer, index: true

    remove_column :personalities, :dater_id, :integer
    remove_column :personalities, :backer_id, :integer
    add_reference :personalities, :dater_backer, index: true

  end
end
