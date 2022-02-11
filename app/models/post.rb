class Post < ApplicationRecord
  has_many :comments
  belongs_to :user

  def as_json
    {
      id: id,
      title: title,
      body: body,
      createdAt: created_at
    }
  end

end
