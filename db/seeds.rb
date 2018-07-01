3.times do |n|
  User.create(email: "test#{n}@test.pl", password: '123123').tap do |user|
    3.times do |m|
      Question.create(user: user, title: "Question #{n}#{m}", content: 'Some very difficult problem description')
    end
  end
end
