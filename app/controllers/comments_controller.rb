class CommentsController < ApplicationController
  http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

  def create
    @phrase = Phrase.find(params[:phrase_id])
    @comment = @phrase.comments.create(comment_params)

    redirect_to phrase_path(@phrase)
  end

  def destroy
    @phrase = Phrase.find(params[:phrase_id])
    @comment = @phrase.comments.find(params[:id])
    @comment.destroy

    redirect_to phrase_path(@phrase), status: :see_other
  end

  private
   def comment_params
     params.require(:comment).permit(:commenter, :body, :status)
   end
end
