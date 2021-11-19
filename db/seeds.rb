def seed
  reset_db
  create_posts
  create_comments
end

def reset_db
  Rake::Task['db:drop'].invoke
  Rake::Task['db:create'].invoke
  Rake::Task['db:migrate'].invoke
end

def create_posts
  10.times do
    post = Post.create!(title: 'Some title', body: 'Bla bla bla text')
    puts "Post created with id #{post.id}"
  end
end

def create_comments
  posts = Post.all

  posts.each do |post|
    10.times do
      comment = post.comments.create!(body: 'Comment body')
      puts "Comment for post #{comment.post.id} created with id #{comment.id}"
    end
  end
end

seed
