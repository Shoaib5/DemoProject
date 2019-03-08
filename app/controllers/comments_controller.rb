class CommentsController < ApplicationController
  before_action :set_product
  # def index
  #   @comments = @product.comments.all
  # end

  # def index
  #   @comments = Comment.all
  # end

  def create
    @comment = @product.comments.build(comment_params)
    if (@comment.save )
      flash.now[:notice] = "comment added succesfully..!"
      respond_to do |format|
        format.html {redirect_to @product}
        format.js
      end
    else
      render @product
    end
  end
  def edit
	 @comment = @product.comments.find(params[:id])
	end
  def update
	  @comment = @product.Comments.find(params[:id])
	  if @comment.update(comment_params)
	    redirect_to @product
	  else
	    render 'edit'
	  end
	end
  def destroy
    @comment = @product.comments.find(params[:id])
    @comment.destroy
    redirect_to product_path(@product)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body,:product_id,:user_id).tap do |whitelisted_params|
       whitelisted_params[:user_id] = current_user.id
      end
    end
    def set_product
       @product = Product.find(params[:product_id])
    end
end
