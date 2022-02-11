class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  def as_json(options = nil)
    {
      id: id,
      body: body
    }
  end

end
