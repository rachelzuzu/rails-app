class ArticlesController < ApplicationController
# define methods that will become the actions for this controller
  # before_action :set_article, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_user!, except: :index

	
# listing all articles
	def index
		@articles=Article.all
	end

	def show
		# Article.find--to find the article we are interested in
		# pass in params[:id] to get :id parameter from request
		# @ is an instance variable to hold a reference to the article object
		@article = Article.find(params[:id])
	end
	
#adding a new article
	def new
		@article=Article.new
	end

	def edit
		@article=Article.find(params[:id])
	end

	def create
# Article refers to model
		# @article=Article.new(article_params)
	@article.user = current_user
# saving the model in the database
		if @article.save
			redirect_to @article
		else
			render 'new'
		end
	end
	

# When a form is submitted, the fields of the form are sent to Rails as parameters.
# use new article model to save the data in the db
# every Rails model can be initialized with its respective attributes, which are automatically mapped to the respective database columns
# params[:article] contains the attributes we're interested in


	def update
	  @article = Article.find(params[:id])
	 
	  if @article.update(article_params)
	    redirect_to @article
	  else
	    render 'edit'
	  end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to articles_path
	end

# When a form is submitted, the fields of the form are sent to Rails as parameters
# we need to whitelist controller parameters to allow and require the title and text parameters for valid use of create
# add require and permit
# made private to make sure it can't be called outside its intended context
	private
		def article_params
			params.require(:article).permit(:title, :text)
		end


end