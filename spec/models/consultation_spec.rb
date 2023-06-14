# spec/models/consultation_spec.rb
require 'rails_helper'
require 'timecop'

RSpec.describe Consultation, type: :model do
  let!(:user) { User.create!(email: 'user@example.com', password: 'password', password_confirmation: 'password', first_name: 'John', last_name: 'Doe', username: 'johndoe') }
  let!(:psychologist) { Psychologist.create!(name: 'John Doe') }

  it 'checks for time conflicts with other consultations' do
    consultation1 = Consultation.create!(scheduled_at: DateTime.now, user: user, psychologist: psychologist)
    consultation2 = Consultation.new(scheduled_at: DateTime.now, user: user, psychologist: psychologist)

    puts "Consultation 1 scheduled at: #{consultation1.scheduled_at}"
    puts "Consultation 2 scheduled at: #{consultation2.scheduled_at}"

    consultation2.valid?

    expect(consultation2.errors[:scheduled_at]).to include("conflicts with another consultation")
    expect(consultation2.errors).to be_truthy
  end

end
