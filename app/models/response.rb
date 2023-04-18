class Response < ApplicationRecord
    belongs_to :article
    belongs_to :prompt

    def self.calculate_total_costs(model, total_tokens)
        if model == "gpt-3.5-turbo"
            total_tokens.to_f / 1000 * 0.002
        end
    end

    def self.perform_request(prompt_content, prompt_id, model, article_id)
        response = HTTParty.post(
            "https://api.openai.com/v1/chat/completions",
            headers: {
                "content-type" => "application/json",
                "Authorization" => "Bearer #{Rails.application.credentials[:open_ai_api_key]}"
            },
            body: JSON[{
                "model" => model,
                "messages" => [
                    {"role": "user", "content": prompt_content}
                ]
            }]
        )
        response_body = JSON.parse(response.body)
        Response.create(
            article_id: article_id,
            prompt_id: prompt_id,
            prompt_content: prompt_content,
            prompt_tokens: response_body["usage"]["prompt_tokens"],
            completion_tokens: response_body["usage"]["completion_tokens"],
            total_tokens: response_body["usage"]["total_tokens"],
            total_costs: calculate_total_costs(model, response_body["usage"]["total_tokens"]),
            model: model,
            response: response_body["choices"][0]["message"]["content"]
        )
    end
end
