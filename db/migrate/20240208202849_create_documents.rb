class CreateDocuments < ActiveRecord::Migration[7.1]
  def change
    create_table :documents do |t|
      t.longtext :content, null: false
      t.text :summary
      t.integer :sentiment

      t.timestamps
    end
  end
end
