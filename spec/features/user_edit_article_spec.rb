require "spec_helper"
require "cancan/matchers"

feature "Manage article" do

  # before(:each) do
  #   sign_up
  #   @article = Article.new(title: "test", text: "test", id: 1, user_id: current_user.id)
  #   @article.save
  # end


    scenario "user can only edit articles which he owns" do
      user = User.create!(:email => "email@ru.ru", :password => "12345678", :username => "test", :id => 1)
      ability = Ability.new(user)
      ability.should be_able_to(:manage, Article.new(title: "test", text: "test", id: 1, user_id: user.id))
      ability.should_not be_able_to(:manage, Article.new(title: "test", text: "test", id: 2, user_id: 2))


    end

    # scenario "allows user to visit edit article page" do

    #   visit edit_article_path(@article)
    #   expect(page).to have_content "Edit article"
    # end  

    # scenario "allows a user to create comment" do
    #   visit article_path(@article)
    #   fill_in :comment_body, :with => 'capybaratestcomment'
    #   click_button "Create Comment"

    #   expect(page).to have_content 'capybaratestcomment'
    # end
end
