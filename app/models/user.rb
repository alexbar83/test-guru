class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :tests_author, class_name: 'Test', foreign_key: :author_id

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end

  validates :email, presence: true
  def tests_by_level(level) 
  	tests.where(lvel: level)
  end
end
