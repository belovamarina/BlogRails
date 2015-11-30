require "spec_helper"

feature "Comment Creation" do

  before(:each) do
    sign_up
    @article = Article.new(title: "test", text: "test", id: 1)
    @article.save
  end

    scenario "allows user to visit article page" do

      visit article_path(@article)
      expect(page).to have_content "Comments:"
    end  

    scenario "allows a user to create comment" do
      visit article_path(@article)
      fill_in :comment_body, :with => 'capybaratestcomment'
      click_button "Create Comment"

      expect(page).to have_content 'capybaratestcomment'
    end
end
