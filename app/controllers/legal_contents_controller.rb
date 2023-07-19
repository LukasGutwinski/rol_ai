class LegalContentsController < ApplicationController
    before_action :set_legal_content, only: [:show, :edit, :update, :destroy]

    def index
        @legal_contents = LegalContent.includes(articles: {responses: :prompt}).all
    end

    def show
        @articles = @legal_content.articles
        @prompts = @legal_content.prompts
        respond_to do |format|
            format.html
            format.xlsx {
              response.headers['Content-Disposition'] = "attachment; filename=#{@legal_content.title}.xlsx"
            }
        end
    end

    def new
        @legal_content = LegalContent.new
    end

    def create 
        @legal_content = LegalContent.new(legal_content_params)
        
        if @legal_content.save
            LegalContent.import_excel(params["legal_content"]["file"], @legal_content.id)
            redirect_to @legal_content, notice: "Legal Content was successfully created."
        else
            respond_to do |format|
                format.turbo_stream { render turbo_stream: turbo_stream.update("form", partial: "form"), status: :bad_request }
            end
        end
    end

    def edit

    end

    def update
        @legal_content.update(legal_content_params)
        redirect_to legal_contents_path
    end

    def destroy
        @legal_content.destroy
        redirect_to legal_contents_path, notice: "Legal Content was successfully deleted."
    end

    private
    def set_legal_content
        @legal_content = LegalContent.find(params[:id])
    end

    def legal_content_params
        params.require(:legal_content).permit(:title)
    end
end