class CommentsController < ApplicationController
  def index
  end

  def show
  end

  def create
  	puts "PARAMS"
  	puts params
  	puts "PARAMS"
  	@comment = Comment.new(comment_params)
  	@comment.save 


  	#.comment.save saves it to the database 
  	redirect_to :back

  	#need to get the comment for that product
  end

  def destroy
  end

  private
    def comment_params
      params.require(:comment).permit(:author, :content, :product_id)
    end
    #this allows them through into the controler
end

