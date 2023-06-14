require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:post) { FactoryBot.create(:post) }
  describe 'GET #index' do
    it 'returns a success response for authenticated user' do
      sign_in user

      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    it 'returns a success response for authenticated user' do
      sign_in user

      post = FactoryBot.create(:post)

      get :show, params: { id: post.id }
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response for authenticated user' do
      sign_in user

      get :new
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response for authenticated user' do
      sign_in user

      post = FactoryBot.create(:post)

      get :edit, params: { id: post.id, post: { public: '1' } }
      expect(response).to be_successful
    end
  end

  describe 'PATCH #update' do
    let!(:post) { FactoryBot.create(:post) }

    it 'updates the post with valid attributes' do
      sign_in user

      patch_params = { title: 'Updated Post' }

      patch :update, params: { id: post.id, post: patch_params }

      expect(flash[:notice]).to eq('Post was successfully updated.')

      post.reload
      expect(post.title).to eq('Updated Post')
    end
  end

  describe 'PATCH #update' do
    it 'updates the post with valid attributes' do
      sign_in user

      patch_params = { post: { title: 'Updated Post' } }

      patch :update, params: { id: post.id }.merge(patch_params)

      expect(flash[:notice]).to eq('Post was successfully updated.')

      post.reload
      expect(post.title).to eq('Updated Post')
    end
  end


  describe 'DELETE #destroy' do
    let!(:post) { FactoryBot.create(:post) }

    it 'destroys the post' do
      sign_in user

      expect {
        delete :destroy, params: { id: post.id }
      }.to change(Post, :count).by(-1)

      expect(flash[:notice]).to eq('Post was successfully destroyed.')
    end
  end
end
