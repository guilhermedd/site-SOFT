namespace :dev do
  desc 'Generate development data'
  task generate: :environment do
    puts 'Generating development data...'
    PASSWORD = 123456

    # Add your logic to create a user here
    User.create!(first_name: 'John',last_name: 'Diel', email: 'john@example.com', username: 'john', password: PASSWORD)
    User.create!(first_name: 'Foo', last_name: 'Diel', email: 'foo@example.com', username: 'foo'  , password: PASSWORD)
    User.create!(first_name: 'Bar', last_name: 'Diel', email: 'bar@example.com', username: 'bar'  , password: PASSWORD)

    puts 'Development data generated successfully.'
  end
end
