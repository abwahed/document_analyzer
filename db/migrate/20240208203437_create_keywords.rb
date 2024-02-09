class CreateKeywords < ActiveRecord::Migration[7.1]
  def change
    create_table :keywords do |t|
      t.belongs_to :document, null: false, foreign_key: true
      t.string :name, null: false
      t.integer :frequency, null: false

      t.timestamps
    end
  end
end
