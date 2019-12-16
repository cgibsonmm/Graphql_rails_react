class User < ApplicationRecord
  has_many :posts

  def posts_count
    posts.count
  end
end
