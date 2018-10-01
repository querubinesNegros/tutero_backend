# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

100.times.do
  User.create([{
    name: Faker::Name.firstname,
    lastname: Faker::Name.unique.lastname,
    email: Faker::Internet.unique.email,
    password: Faker::Internet.unique.password(min_length = 8, max_length = 20),
    cellphone: Faker::PhoneNumber.cell_phone 
  }])
end

dias = ["lunes", "martes", "miercoles", "jueves", "viernes", "sabado"]
100.times.do
  i = rand(6)
  j = rand(7...22)
  Shedule.create([{
    name: dias[i],
    hour: j
  }])
end

100.times.do
  Post.create([{    
    name: Faker::Lorem.sentence(word_count = 4, supplemental = false, random_words_to_add = 6),
    description: Faker::Lorem.paragraph(sentence_count = 3, supplemental = false, random_sentences_to_add = 3)    
  }])
end

100.times.do
i = rand(5)
i = rand(180)
Tutoring.create([{    
    duration: j,    
    noteTutor: Faker::Lorem.paragraph(sentence_count = 3, supplemental = false, random_sentences_to_add = 3),    
    date: Faker::Date.forward(days = 365),
    score: i      
  }])
end

    