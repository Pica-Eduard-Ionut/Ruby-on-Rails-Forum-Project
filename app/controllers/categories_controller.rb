class CategoriesController < ApplicationController
    def index
      @categories = Category.all
    end
  
    def show
      @category = Category.find(params[:id])
      @posts = @category.posts
    end
  
    def new
      @category = Category.new
    end
  
    def create
      @category = Category.new(category_params)
      if @category.save
        redirect_to category_path(@category), notice: 'Post created successfully.'

      else
        render :new
      end
    end
  
    private
  
    def category_params
      params.require(:category).permit(:title)
    end
  end
  