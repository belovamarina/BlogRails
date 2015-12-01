require "spec_helper"
require "cancan/matchers"

feature "Manage comment" do

  # before(:each) do
  #   sign_up
  #   @article = Article.new(title: "test", text: "test", id: 1, user_id: current_user.id)
  #   @article.save
  # end


    scenario "user can only manage comments which he owns" do
      user = User.create!(email: "email@ru.ru", password: "12345678", username: "test", id: 1)
      ability = Ability.new(user)
      ability.should be_able_to(:manage, Comment.new(body: "test", id: 1, user_id: user.id))
      ability.should_not be_able_to(:manage, Comment.new(body: "test", id: 2, user_id: 2))

    end

end
