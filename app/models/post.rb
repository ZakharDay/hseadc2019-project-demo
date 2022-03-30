class Post < ApplicationRecord
  has_many :comments
  belongs_to :user

  acts_as_taggable_on :tags, :categories
  mount_uploader :cover, CoverUploader

  def as_json
    {
      id: id,
      title: title,
      body: body,
      createdAt: created_at
    }
  end

end
