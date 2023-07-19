class Prompt < ApplicationRecord
    belongs_to :legal_content

    def self.replace_placeholder(text, article)
        text = text.gsub(/{{domain}}/, article.domain) if article.domain.present?
        text = text.gsub(/{{theme}}/, article.theme) if article.theme.present?
        text = text.gsub(/{{sub_theme}}/, article.sub_theme) if article.sub_theme.present?
        text = text.gsub(/{{text_title}}/, article.text_title) if article.text_title.present?
        text = text.gsub(/{{article_title}}/, article.article_title) if article.article_title.present?
        text = text.gsub(/{{requirement}}/, article.requirement) if article.requirement.present?
        text = text.gsub(/{{status}}/, article.status) if article.status.present?
        text
    end
end
