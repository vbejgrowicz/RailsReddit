# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
require 'faker'

Post.all.each(&:destroy)
Topic.all.each(&:destroy)

topics = ['Harry Potter', 'Hey Arnold', 'Friends']
faker = [Faker::HarryPotter, Faker::HeyArnold, Faker::Friends]

topics.each_with_index do |topic, index|
  topic = Topic.create(name: topic)
  5.times { Post.create(topic_id: topic.id, title: "#{faker[index].character} at #{faker[index].location}", text: faker[index].quote) }
  5.times { Post.create(topic_id: topic.id, title: faker[index].quote) }
  5.times { Post.create(topic_id: topic.id, title: "#{faker[index].character} at #{faker[index].location}", text: faker[index].quote) }
  5.times { Post.create(topic_id: topic.id, title: faker[index].quote) }
end

topics = ['How I Met Your Mother', 'StarWars', 'SiliconValley', 'Movies', 'The Fresh Prince of Bel-Air']
faker = [Faker::HowIMetYourMother, Faker::StarWars, Faker::SiliconValley, Faker::Movie, Faker::TheFreshPrinceOfBelAir]

topics.each_with_index do |topic, index|
  topic = Topic.create(name: topic)
  20.times { Post.create(topic_id: topic.id, title: faker[index].quote) }
end

topic = Topic.create(name: 'Hipster')
20.times { Post.create(topic_id: topic.id, title: Faker::Hipster.sentence, text: Faker::Hipster.paragraph) }

topic = Topic.create(name: 'Hacker')
20.times { Post.create(topic_id: topic.id, title: "#{Faker::Hacker.noun} #{Faker::Hacker.ingverb}", text: Faker::Hacker.say_something_smart) }
