class FriendsController < ApplicationController
  before_action :set_friend, only: %i[ show edit update destroy ]

  # GET /friends or /friends.json
  def index
    search_term = params[:search]

    if search_term.nil? or search_term.empty?
      @friends = []
    else
      terms = search_term.split
      @friends = User.where("first_name LIKE ? OR last_name LIKE ? OR email LIKE ?", "%#{terms[0]}%", "%#{terms[0]}%", "%#{terms[0]}%")

      terms.drop(1).each do |term|
        @friends = @friends.or(User.where("first_name LIKE ? OR last_name LIKE ? OR email LIKE ?", "%#{term}%", "%#{term}%", "%#{term}%"))
      end
    end
  end

  def friendProfile
    
    if !Post.where("user_id = ? AND public = true", params[:friend_id]).empty?
      @posts = Post.where("user_id = ? AND public = true", params[:friend_id])
    else
      @posts = []
    end
  end

  # GET /friends/1 or /friends/1.json
  def show
    @friends = []
    Friend.where(user_id: current_user.id).each do |friend|
      @friends << User.find(friend.friend_id)
    end
  end

  def create_friendship
    friend = User.find(params[:friend_id])
    Friend.create(user_id: current_user.id, friend_id: friend.id) unless Friend.find_by(user_id: current_user.id, friend_id: friend.id)
    redirect_to show_friends_path, notice: "Friendship created successfully."
  end


  # GET /friends/new
  def new
    @friend = Friend.new
  end

  # GET /friends/search
  def search
  end
  # GET /friends/1/edit
  def edit
  end

  # POST /friends or /friends.json
  def create
    @friend = Friend.new(friend_params)

    respond_to do |format|
      if @friend.save
        format.html { redirect_to friend_url(@friend), notice: "Friend was successfully created." }
        format.json { render :show, status: :created, location: @friend }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /friends/1 or /friends/1.json
  def update
    respond_to do |format|
      if @friend.update(friend_params)
        format.html { redirect_to friend_url(@friend), notice: "Friend was successfully updated." }
        format.json { render :show, status: :ok, location: @friend }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friends/1 or /friends/1.json
  def destroy
    @friend.destroy

    respond_to do |format|
      format.html { redirect_to friends_url, notice: "Friend was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend
      @friend = Friend.find_by(id: params[:id])
      # redirect_to friends_path, notice: "Friend not found" unless @friend && @friend.user == current_user
    end


    # Only allow a list of trusted parameters through.
    def friend_params
      params.require(:friend).permit(:user_id, :friend_id)
    end
end
