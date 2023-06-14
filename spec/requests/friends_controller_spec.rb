require 'rails_helper'

RSpec.describe FriendsController, type: :controller do
  describe 'GET #index' do
    it 'assigns @friends to an empty array if search term is nil or empty' do
      sign_in User.create # Create and sign in a user

      get :index, params: { search: nil }
      expect(assigns(:friends)).to eq([])

      get :index, params: { search: '' }
      expect(assigns(:friends)).to eq([])
    end

    it 'assigns @friends with search results if search term is present' do
      current_user = User.create
      user1 = User.create(first_name: 'John', last_name: 'Smith', email: 'john@example.com', password: "password", password_confirmation: "password", username: "guilhermedd")
      user2 = User.create(first_name: 'Jane', last_name: 'Smith', email: 'jane@example.com', password: "password", password_confirmation: "password", username: "guilhermeddiel")

      sign_in current_user

      get :index, params: { search: 'John' }
      expect(assigns(:friends)).to eq([user1])

      get :index, params: { search: 'Jane Doe' }
      expect(assigns(:friends)).to eq([user2])
    end
  end

  describe 'GET #friendProfile' do
    it 'assigns @posts to an empty array if no public posts exist for the friend' do
      friend_id = 1

      allow(Post).to receive(:where).and_return([])

      get :friendProfile, params: { friend_id: friend_id }
      expect(assigns(:posts)).to eq([])
    end

    it 'assigns @posts with public posts of the friend' do
      friend = User.create(first_name: 'Jane', last_name: 'Smith', email: 'jane@example.com', password: "password", password_confirmation: "password", username: "guilhermeddiel")
      post1 = Post.create(user_id: friend.id, public: true)
      post2 = Post.create(user_id: friend.id, public: false)

      get :friendProfile, params: { friend_id: friend.id }
      expect(assigns(:posts)).to eq([post1])
    end
  end

  describe 'GET #show' do
    it 'assigns @friends with current user\'s friends' do
      current_user = User.create(first_name: 'Jane', last_name: 'Smith', email: 'jane@example.com', password: "password", password_confirmation: "password", username: "guilhermeddiel")
      friend1 = User.create(first_name: 'John', last_name: 'Doe', email: 'john@example.com', password: "password", password_confirmation: "password", username: "johndoe")
      friend2 = User.create(first_name: 'Alice', last_name: 'Johnson', email: 'alice@example.com', password: "password", password_confirmation: "password", username: "alicejohnson")
      Friend.create(user_id: current_user.id, friend_id: friend1.id)
      Friend.create(user_id: current_user.id, friend_id: friend2.id)

      sign_in current_user

      get :show
      expect(assigns(:friends)).to eq([friend1, friend2])
    end

  end

  describe 'POST #create_friendship' do
    it 'creates a friendship if it does not already exist' do
      current_user = User.create(first_name: 'Jane', last_name: 'Smith', email: 'jane@example.com', password: "password", password_confirmation: "password", username: "guilhermeddiel")
      friend = User.create(first_name: 'John', last_name: 'Doe', email: 'john@example.com', password: "password", password_confirmation: "password", username: "johndoe")

      allow(controller).to receive(:current_user).and_return(current_user)

      post :create_friendship, params: { friend_id: friend.id }
      expect(Friend.find_by(user_id: current_user.id, friend_id: friend.id)).to be_present
    end

  end
end
