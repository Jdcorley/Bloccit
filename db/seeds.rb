require 'random_data'

# Create Posts
50.times do
Post.create!(
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
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Question.count} questions created"