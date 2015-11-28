class Article < ActiveRecord::Base
  validates :title, presence: true
  validates :text, presence: true
  has_many :comments, dependent: :destroy
  belongs_to :user

  def subject
  	title
  end
end
