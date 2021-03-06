class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]


  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)

      if @comment.save
        redirect_to post_path(@comment.post), notice: 'Comment was successfully created.'
      else
        render :new
      end
    end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
      if @comment.update(comment_params)
        redirect_to post_path(@comment.post), notice: 'Comment was successfully updated.' }
      else
        render :edit
      end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      redirect_to post_path(@comment.post), notice: 'Comment was successfully deleted.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:user_id, :post_id, :body)
    end
end
