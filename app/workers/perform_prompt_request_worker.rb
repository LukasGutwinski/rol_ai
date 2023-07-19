class PerformPromptRequestWorker
    include Sidekiq::Worker

    sidekiq_options throttle: { threshold: 200, period: 1.minute }

  
    def perform(prompt_id, article_id)
      prompt = Prompt.find(prompt_id)
      article = Article.find(article_id)
      prompt_without_placeholders = Prompt.replace_placeholder(prompt.content, article)
      Response.perform_request(prompt_without_placeholders, prompt.id, prompt.model, prompt.temperature, article.id)
    end
  end