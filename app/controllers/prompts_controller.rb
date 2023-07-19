class PromptsController < ApplicationController
    before_action :set_prompt, only: [:show, :edit, :update, :destroy]

    def new
        @prompt = Prompt.new
    end

    def create 
        @prompt = Prompt.new(prompt_params)

        if @prompt.save
            @prompt.legal_content.articles.each do |article|
                PerformPromptRequestWorker.perform_async(@prompt.id, article.id)
            end
            @legal_content = @prompt.legal_content
            respond_to do |format|
                format.turbo_stream { render turbo_stream: turbo_stream.prepend("prompts", @prompt) }
            end      
        else
            render :new
        end
    end

    def show
    end

    def destroy
        @prompt.destroy
        redirect_to legal_content_path(@prompt.legal_content_id), notice: "Prompt was successfully deleted."
    end

    private
    def set_prompt
        @prompt = Prompt.find(params[:id])
    end

    def prompt_params
        params.require(:prompt).permit(:title, :content, :model, :legal_content_id, :temperature)
    end
end