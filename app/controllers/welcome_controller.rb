class WelcomeController < ApplicationController
  def index
    if user_signed_in?
      @post = current_user.posts.empty? ? [] : current_user.posts
    end
  end
end
