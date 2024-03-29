class StoryCommentsController < ApplicationController
  # GET /story_comments
  # GET /story_comments.json
  def index
    @story_comments = StoryComment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @story_comments }
    end
  end

  # GET /story_comments/1
  # GET /story_comments/1.json
  def show
    @story_comment = StoryComment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @story_comment }
    end
  end

  # GET /story_comments/new
  # GET /story_comments/new.json
  def new
    @story_comment = StoryComment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @story_comment }
    end
  end

  # GET /story_comments/1/edit
  def edit
    @story_comment = StoryComment.find(params[:id])
  end

  # POST /story_comments
  # POST /story_comments.json
  def create
    @story = Story.find(params[:story_id])
    @story_comment = @story.story_comments.new(params[:story_comment])
    @user = current_user
    @story_comment.user_id = @user.id 

    respond_to do |format|
      if @story_comment.save
        format.html { redirect_to story_path(@story), notice: 'Story comment was successfully created.' }
        format.json { render json: @story_comment, status: :created, location: @story_comment }
      else
        format.html { render action: "new" }
        format.json { render json: @story_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /story_comments/1
  # PUT /story_comments/1.json
  def update
    @story_comment = StoryComment.find(params[:id])

    respond_to do |format|
      if @story_comment.update_attributes(params[:story_comment])
        format.html { redirect_to @story_comment, notice: 'Story comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @story_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /story_comments/1
  # DELETE /story_comments/1.json
  def destroy
    @story = Story.find(params[:story_id])
    @story_comment = @story.story_comments.find(params[:id])
    @story_comment.destroy

    respond_to do |format|
      format.html { redirect_to story_path(@story) }
      format.json { head :no_content }
    end
  end
end
