class BlogsController < ApplicationController
	def index
		@blogs = Blog.order("created_at DESC")
	end

	def show
		@blog = Blog.find(params[:id])
	end

    def new
    	@blog = Blog.new
  	end

	def create
		@blog = Blog.new(blog_params)
		if @blog.save
	      redirect_to blogs_path, notice: "The article has been successfully created."
	    else
	      render action: "new"
	    end
	end
	def edit
    	@blog = Blog.find(params[:id])
  	end

  	def update
    	@blog = Blog.find(params[:id])
    	if @blog.update_attributes(blog_params)
      	redirect_to blogs_path, notice: "The article has been successfully updated."
    	else
      	render action: "edit"
    	end
  	end

  	def destroy
  		@blog = Blog.find(params[:id])
  		@blog.body = nil
  		if @blog.destroy
  			redirect_to root_path, notice: "The article has been successfully created."
  		end
  	end
	def blog_params
	   params.require(:blog).permit(:title, :body)
	end
end
