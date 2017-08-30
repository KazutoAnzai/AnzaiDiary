class ArticlesController < ApplicationController
	before_action :authenticate_user!, only: [:new, :edit, :delete]

	before_action :set_article, only: [:show, :edit, :update, :destroy]

	def top
		render :layout => 'top'
	end

	def index
		@articles = Article.all.order(id: "DESC")
	end

	def show
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
		if @article.save
			redirect_to articles_path
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		@article.update(article_params)
		redirect_to article_path(@article)
	end

	def destroy
		@article.destroy
		redirect_to articles_path
	end


	private
	def article_params
		params.require(:article).permit(:title, :body, :picture, :author)
	end

	def set_article
		@article = Article.find(params[:id])
	end
end
