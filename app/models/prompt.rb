class Prompt < ApplicationRecord
    belongs_to :legal_content

    def self.replace_placeholder(text, article)
        text = text.gsub(/{{domain}}/, article.domain)
        text = text.gsub(/{{theme}}/, article.theme)
        text = text.gsub(/{{sub_theme}}/, article.sub_theme)
        text = text.gsub(/{{text_title}}/, article.text_title)
        text = text.gsub(/{{article_title}}/, article.article_title)
        text = text.gsub(/{{requirement}}/, article.requirement)
        text = text.gsub(/{{status}}/, article.status)
        text
    end
end
