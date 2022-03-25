class Message < ApplicationRecord
  belongs_to :chat
  belongs_to :user

  def as_json(options = nil)
    {
      id: id,
      userId: user_id,
      userName: User.find(user_id).email,
      text: body
    }
  end

end
