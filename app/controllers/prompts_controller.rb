class PromptsController < ApplicationController
    before_action :set_prompt, only: [:show, :edit, :update, :destroy]

    def new
        @prompt = Prompt.new
    end

    def create 
        @prompt = Prompt.new(prompt_params)

        if @prompt.save
            PerformPromptRequestJob.perform_later(@prompt)
            redirect_to legal_content_path(@prompt.legal_content_id), notice: "Prompt was successfully created."
        else
            render :new
        end
    end

    def show
        @prompt = Prompt.find(params[:id])
    end

    private
    def set_legal_prompt
        @prompt = Prompt.find(params[:id])
    end

    def prompt_params
        params.require(:prompt).permit(:title, :content, :model, :legal_content_id)
    end
end