class Article < ApplicationRecord
    belongs_to :legal_content
    has_many :responses, dependent: :destroy
end
