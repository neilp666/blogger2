class ArticlesController < ApplicationController

	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
	  	@article.save
	  	redirect_to article_path(@article)
	  	flash.notice = "Article '#{@article.title}' Created!"
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to articles_url
		flash.notice = "Article '#{@article.title}' Destroy!"
	end

	def edit
		@article = Article.find(params[:id])

	end

	def update
		@article = Article.find(params[:id])
		@article.update(article_params)

		flash.notice = "Article '#{@article.title}' Updated!"

		redirect_to article_path(@article)
	end


	def article_params
      params.require(:article).permit(:title, :body)
   end
end
