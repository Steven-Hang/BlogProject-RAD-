class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy]
  before_action :set_page, only: [:index]
  
  POSTS_PER_PAGE = 8
  
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
    @posts = Post.order(:id).limit(POSTS_PER_PAGE).offset(@page * POSTS_PER_PAGE) 
  end
 
  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    if current_user
    @post = current_user.posts.build(post_params)
    	if @post.save
      		flash[:success] = "post created!"
      		redirect_to root_url
    	else
      		render 'posts/new'
    	end 
	else
	  flash[:warning] = " Please Login first, In order to post"
		redirect_to login_path	
    end
  end
    
  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :index, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end
    
    def set_page
       @page = params[:page].to_i 
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :source, :comments , :user_id)
    end
end
