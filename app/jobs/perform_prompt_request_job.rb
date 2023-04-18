class PerformPromptRequestJob < ApplicationJob
  queue_as :default

  def perform(prompt)
    prompt.legal_content.articles.each do |article|
      prompt_without_placeholders = Prompt.replace_placeholder(prompt.content, article)
      Response.perform_request(prompt_without_placeholders, prompt.id, prompt.model, article.id)
    end
  end
end
