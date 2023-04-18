class LegalContent < ApplicationRecord
    has_many :articles
    has_many :prompts

    def self.import_excel(file, legal_content_id)
        content_file = Creek::Book.new file
        content_sheet = content_file.sheets[0]
        row_number = 7
        content_sheet.rows.drop(5).each do |row|        
            Article.create(
                legal_content_id: legal_content_id,
                domain: row["A#{row_number}"],
                theme: row["B#{row_number}"],
                sub_theme: row["C#{row_number}"],
                text_title: row["D#{row_number}"],
                article_title: row["E#{row_number}"],
                requirement: row["F#{row_number}"],
                status: row["G#{row_number}"]
            )
            row_number += 1
        end
    end
end
