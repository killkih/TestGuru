# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

admin = Admin.create!(first_name: 'Bob', last_name: 'Cooper', username: 'bobcop', email: 'killkih123@gmail.com', type: 'Admin',
                      password: 'testguru')
user = User.create!(first_name: 'Tom', last_name: 'Cooper', username: 'tomcop', email: 'tom@gmail.com', type: 'User',
                    password: 'testguru')

category = Category.create!(title: 'category1')

tests = Test.create!([{ title: 'test1', level: 0, category: category, creator: admin, timer: 1 },
                      { title: 'test2', level: 1, category: category, creator: admin, timer: 2 },
                      { title: 'test3', level: 2, category: category, creator: admin, timer: 3 }])

tests.each do |test|
  Question.create!([{ body: 'question1', test: test },
                    { body: 'question2', test: test },
                    { body: 'question3', test: test }])
  TestPassage.create!(user: user, test: test, current_question: test.questions.first, correct_questions: 0)
end

Question.all.each do |question|
  Answer.create!([{ body: 'answer1', correct: false, question: question },
                  { body: 'answer2', correct: true, question: question },
                  { body: 'answer3', correct: false, question: question },
                  { body: 'answer4', correct: false, question: question }])
end

admin.created_badges.create!([{ title: 'First Try', condition: 'first_try' },
                              { title: 'Passed Category', condition: 'passed_category', option: category.title },
                              { title: 'Passed Level', condition: 'passed_level', option: '2' }])
