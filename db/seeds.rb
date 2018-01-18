require 'random_data'
# Create Topics
15.times do 
 Topic.create!(
	name: RandomData.random_sentence,
	description: RandomData.random_paragraph
)
end 
topics = Topic.all

# Create Sponsored Posts
25.times do 
SponsoredPost.create!(
	topic: topics.sample,
	title: RandomData.random_sentence,
	body: RandomData.random_paragraph,
	price: RandomData.random_number
)
end 
sponsoredposts = SponsoredPost.all 

# Create Posts
50.times do
Post.create!(
	topic: topics.sample,
	title: RandomData.random_sentence,
	body: RandomData.random_paragraph
	)
end 
posts = Post.all

# Create Comments

100.times do
	Comment.create!(
		post: posts.sample,
		body: RandomData.random_paragraph
		)
end

# Create Questions
100.times do 
	Question.create!(
	title: RandomData.random_sentence,
	body: RandomData.random_paragraph,
	resolved: false							
	)
end 

puts"#{Post.count}"
Post.find_or_create_by(title: "A unique title", body: "A unique body")
puts"#{Post.count}"

puts "Seed Finished"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Question.count} questions created"
puts "#{SponsoredPost.count} sponsoredposts created"
