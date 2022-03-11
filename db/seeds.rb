def seed
  reset_db
  create_users
  create_posts
  create_comments

  create_chats_for_users
  create_messages
end

def reset_db
  Rake::Task['db:drop'].invoke
  Rake::Task['db:create'].invoke
  Rake::Task['db:migrate'].invoke
end

def create_users
  i = 0

  10.times do
    user_data = {
      email: "user_#{i}@email.com",
      password: 'testtest'
    }

    if i == 0
      user_data[:email] = "admin@email.com"
      user_data[:admin] = true
    end

    user = User.create!(user_data)
    puts "User created with id #{user.id}"
    i += 1
  end
end

def create_posts
  10.times do
    user = User.all.sample
    post = user.posts.create!(title: 'Some title', body: 'Bla bla bla text')
    puts "Post created with id #{post.id} by user with id #{post.user.id}"
  end
end

def create_comments
  posts = Post.all

  posts.each do |post|
    10.times do
      user = User.all.sample
      comment = post.comments.create!(user_id: user.id, body: 'Comment body')
      puts "Comment for post #{comment.post.id} created with id #{comment.id} by user with id #{comment.user.id}"
    end
  end
end

def create_chats_for_users
  10.times do
    users = User.all.sample(2)
    # users = User.all.select(2)
    # puts users.class
    chat = Chat.create!
    users[0].user_chats.create!(chat_id: chat.id)
    users[1].user_chats.create!(chat_id: chat.id)

    puts "Chat created with id #{chat.id}"
    puts "Chat with users #{chat.users[0].id} #{chat.users[1].id}"
  end
end

def create_messages
  chats = Chat.all

  chats.each do |chat|
    chat_users = chat.users

    10.times do
      message_one = chat.messages.create!(body: 'test', user_id: chat_users[0].id)
      message_two = chat.messages.create!(body: 'test', user_id: chat_users[1].id)

      puts "Message with id #{message_one.id} created for chat #{message_one.chat.id} by user #{message_one.user.id}"
      puts "Message with id #{message_two.id} created for chat #{message_two.chat.id} by user #{message_two.user.id}"
    end
  end
end

seed

# ARQI Methods
# where
# find
# group
# includes
# joins
# limit
# select

# Array Methods
# collect
# reject
# compact
# delete
# delete_at
# delete_if
# flatten
# join
# replace
# reverse
# sample
# shift
# slice
# sort
# uniq
# pop
# push
# <<
