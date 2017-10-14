require 'random_data'

50.times do
    Post.create!(
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph
        )
end
posts = Post.all

100.times do
    Comment.create!(
        post: posts.sample,
        body: RandomData.random_paragraph
        )
end

my_post = Post.find_or_create_by!(
    title: "Nich Post",
    body: "This is my unique post"
    )
    
my_post.comments.find_or_create_by!(body: "This is my unique comment")

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"