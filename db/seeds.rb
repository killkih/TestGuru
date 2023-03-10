# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!(name: 'Bob', role: 'creater')
User.create!(name: 'Tom', role: 'user')

Category.create!(title: 'category1')

Test.create!([{title: 'test1', level: 0, category_id: Category.first.id, author_id: User.order('id').first.id},
              {title: 'test2', level: 1, category_id: Category.first.id, author_id: User.order('id').first.id},
              {title: 'test3', level: 2, category_id: Category.first.id, author_id: User.order('id').first.id}])

Test.all.each do |test|
  Question.create!([{body: 'question1', test_id: test.id},
                    {body: 'question2', test_id: test.id},
                    {body: 'question3', test_id: test.id}])
end

Question.all.each do |question|
  Answer.create!([{body: 'answer1', correct: false, question_id: question.id},
                  {body: 'answer2', correct: true, question_id: question.id},
                  {body: 'answer3', correct: false, question_id: question.id},
                  {body: 'answer4', correct: false, question_id: question.id}])
end

Result.create!([{status: true, test_id: 1, user_id: User.order('id').last.id},
                {status: true, test_id: 2, user_id: User.order('id').last.id},
                {status: false, test_id: 3, user_id: User.order('id').last.id}])
