class AddAuthorCommentArticle < ActiveRecord::Migration
  def change
    change_table :articles do |t|
      t.belongs_to :user, index: true
    end

    change_table :comments do |t|
      t.belongs_to :user, index: true
    end
  end
end
