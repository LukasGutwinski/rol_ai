class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles, id: :uuid do |t|
      t.references :legal_content, null: false, foreign_key: true, type: :uuid
      t.string :domain
      t.string :theme
      t.string :sub_theme
      t.text :text_title
      t.text :article_title
      t.text :requirement
      t.string :status

      t.timestamps
    end
  end
end
