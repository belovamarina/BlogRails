class Article < ActiveRecord::Base
  validates :title, presence: true, length: { in: 2..40 }
  validates :text, presence: true, length: { maximum: 2000 }
  has_many :comments, dependent: :destroy
  belongs_to :user

  def subject
  	title
  end

  def last_comment
  	comments.last
  end
end
