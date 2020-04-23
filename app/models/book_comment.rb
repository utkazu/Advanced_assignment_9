class BookComment < ApplicationRecord
  belongs_to :book
  validates :user_id, presence: true
  validates :book_id, presence: true
  validates :comment, presence: true

  def user
    User.find(self.user_id)
  end
end
