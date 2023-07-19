class PerformPromptRequestJob < ApplicationJob
  queue_as :default

  def perform(prompt, article)
    prompt_without_placeholders = Prompt.replace_placeholder(prompt.content, article)
    Response.perform_request(prompt_without_placeholders, prompt.id, prompt.model, prompt.temperature, article.id)
  end
end