class CreatePrompts < ActiveRecord::Migration[7.0]
  def change
    create_table :prompts, id: :uuid do |t|
      t.text :content
      t.string :model
      t.string :title
      t.references :legal_content, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
