class Comment < ApplicationRecord
  belongs_to :post

  def as_json(options = nil)
    {
      id: id,
      body: body
    }
  end

end
