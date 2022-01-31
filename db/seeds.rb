# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

types = ['Audio', 'Reading', 'File', 'Video', 'News']
types.each do |t|
  Type.create(
    name: t
  )
end

categories = ['Programming', 'Music', 'DC Comics', 'Books', 'Science']
categories.each do |c|
  Category.create(
    name: c,
    private: [true, false].sample
  )
end

5.times do
  Category.create(
    name: Faker::ProgrammingLanguage.name,
    private: [true, false].sample,
    parent_id: 1
  )
end 

subcat2 = ['Indie', 'Rock', 'Pop', 'Progressive Rock', 'Electronic']
subcat2.each do |s|
  Category.create(
    name: s,
    private: [true,false].sample,
    parent_id: 2
  )
end

5.times do
  Category.create(
    name: Faker::DcComics.hero,
    private: false,
    parent_id: 3
  )
end

5.times do
  Category.create(
    name: Faker::Book.genre,
    private: false,
    parent_id: 4
  )
end

5.times do
  Category.create(
    name: Faker::Science.science,
    private: false,
    parent_id: 5
  )
end

5.times do
  Marker.create!(
    title: Faker::Book.title,
    url: Faker::Internet.url, 
  )
end

15.times do
  Marker.create!(
    title: Faker::Music.band,
    url: Faker::Internet.url,
  )
end

Marker.all.each do |m|
  m.categories << Category.find(rand(Category.first.id..Category.last.id))
  m.types << Type.find(rand(Type.first.id..Type.last.id))
end