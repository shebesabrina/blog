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
        # binding.pry
        @article = Article.new(
            title: params[:article][:title],
            body: params[:article][:title])
        @article.save
        redirect_to article_path(@article)
    end
end