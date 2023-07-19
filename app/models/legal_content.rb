class LegalContent < ApplicationRecord
    has_many :articles, dependent: :destroy
    has_many :prompts, dependent: :destroy

    def self.import_excel(file, legal_content_id)
        content_file = Creek::Book.new file
        content_sheet = content_file.sheets[0]
        row_number = 7
        grouped_articles = {}

        content_sheet.rows.drop(5).each do |row|
            id = row["J#{row_number}"].nil? ? row_number : row["J#{row_number}"]
            requirement = row["F#{row_number}"]

            if grouped_articles.key?(id)
                grouped_articles[id][:requirement] << "\n#{requirement}"
            else
                grouped_articles[id] = {
                    legal_content_id: legal_content_id,
                    domain: row["A#{row_number}"],
                    theme: row["B#{row_number}"],
                    sub_theme: row["C#{row_number}"],
                    text_title: row["D#{row_number}"],
                    article_title: row["E#{row_number}"],
                    requirement: requirement,
                    status: row["G#{row_number}"]
                }
            end
            row_number += 1
        end

        grouped_articles.each_value do |article_data|
            Article.create(article_data)
        end
    end
end
