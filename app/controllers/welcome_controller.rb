class WelcomeController < ApplicationController
  def index
    if user_signed_in?
      @post = current_user.posts if !current_user.posts.empty? else [] end
  end
end
