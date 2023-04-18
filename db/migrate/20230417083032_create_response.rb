class CreateResponse < ActiveRecord::Migration[7.0]
  def change
    create_table :responses, id: :uuid do |t|
      t.references :article, null: false, foreign_key: true, type: :uuid
      t.references :prompt, null: false, foreign_key: true, type: :uuid
      t.integer :prompt_tokens
      t.integer :completion_tokens
      t.integer :total_tokens
      t.string :model
      t.text :response
      t.text :prompt_content
      t.float :prompt_costs
      t.float :completion_costs
      t.float :total_costs

      t.timestamps
    end
  end
end
