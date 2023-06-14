require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  describe 'GET #index' do
    context 'when user is signed in' do
      let(:user) { FactoryBot.create(:user) }

      before do
        sign_in user
      end

      context 'when user has posts' do
        let!(:post) { FactoryBot.create(:post, user: user) }

        it 'assigns the user posts to @post' do
          get :index
          expect(assigns(:post)).to eq([post])
        end
      end

      context 'when user has no posts' do
        it 'assigns an empty array to @post' do
          get :index
          expect(assigns(:post)).to eq([])
        end
      end
    end
  end
end
