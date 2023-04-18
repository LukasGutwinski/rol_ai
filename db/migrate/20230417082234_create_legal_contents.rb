class CreateLegalContents < ActiveRecord::Migration[7.0]
  def change
    create_table :legal_contents, id: :uuid do |t|
      t.string :title

      t.timestamps
    end
  end
end
