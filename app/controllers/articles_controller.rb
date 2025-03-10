class ArticlesController < ApplicationController
  before_action :set_article, only: [ :show, :edit, :update, :destroy ]
  # GET /articles or /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1 or /articles/1.json
  def show
  end

    # GET /articles/new
    def new
      @article = Article.new
    end

    # GET /articles/1/edit


    # POST /articles or /articles.json
    def create
      @article = Article.new(article_params)
      @article.user = User.first
      if @article.save
        flash[:notice] = "Article was created succesfully"
        redirect_to @article
      else
        render "new", status: :unprocessable_entity
      end
    end
    # respond_to do |format|
    #   if @article.save
    #     format.html { redirect_to @article, notice: "Article was successfully created." }
    #     format.json { render :show, status: :created, location: @article }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @article.errors, status: :unprocessable_entity }
    #   end
    # end

    def edit
      @article = Article.find(params[:id])
    end
    # PATCH/PUT /articles/1 or /articles/1.json
    def update
      # @article = Article.find(params[:id])
      #
      if @article.update(article_params)
        flash[:notice] = "Article was eddited succsesfully"
        redirect_to @article
      else
        render "edit", status: :unprocessable_entity
      end
    end

    # DELETE /articles/1 or /articles/1.json
    def destroy
      # @article = Article.find(params[:id])
      @article.destroy
      redirect_to articles_path, notice: "Article was successfully destroyed."
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_article
        @article = Article.find(params.expect(:id))
      end

      # Only allow a list of trusted parameters through.
      def article_params
        params.expect(article: [ :title, :description ])
      end

    private
    def set_article
      @article = Article.find(params[:id])
    end
    def article_params
        params.require(:article).permit(:title, :description)
    end
end
