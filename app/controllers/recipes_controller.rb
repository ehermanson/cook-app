class RecipesController < ApplicationController

	before_action :find_recipe, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		if params[:category].blank?
			@recipe = Recipe.all.order("created_at DESC")
		else
			@category_id = Category.find_by(category: params[:category]).id
			@recipe = Recipe.where(category_id: @category_id).order("created_at DESC")
		end
	end

	def show
	end

	def new
		@recipe = current_user.recipes.build
	end

	def create
		@recipe = current_user.recipes.build(recipe_params)

		if @recipe.save
			redirect_to @recipe, notice: "Successfully created new recipe"
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @recipe.update(recipe_params)
			redirect_to @recipe
		else
			render 'edit'
		end
	end

	def destroy
		if current_user == @recipe.user
			@recipe.destroy
			redirect_to root_path, notice: "Successfully deleted recipe!"
		else
			redirect_to @recipe, notice: "You can't delete someone else's recipe!"
		end
	end

	private
	def recipe_params
		params.require(:recipe).permit(:title, :description, :image, :category_id, ingredients_attributes: [:id, :name, :_destroy], directions_attributes: [:id, :step, :_destroy])
	end

	def find_recipe
		@recipe = Recipe.find(params[:id])
	end

end