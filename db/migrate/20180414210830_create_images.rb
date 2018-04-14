class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.references :user
      t.integer :subject
      t.string :file

      t.timestamps
    end
  end
end
