require 'rails_helper'
require 'timecop'

RSpec.describe Consultation, type: :model do
  let(:user) do
    User.create(
      first_name: 'Jane',
      last_name: 'Smith',
      email: 'jane@example.com',
      password: 'password',
      password_confirmation: 'password',
      username: 'guilhermeddiel'
    )
  end

  let(:psychologist) do
    Psychologist.create(
      name: 'John',
      )
  end

  it 'is valid with a scheduled_at, user, and psychologist' do
    consultation = Consultation.new(scheduled_at: DateTime.now, user: user, psychologist: psychologist)
    expect(consultation).to be_valid
  end

  it 'is invalid without a scheduled_at' do
    consultation = Consultation.new(scheduled_at: nil, user: user, psychologist: psychologist)
    expect(consultation).to be_invalid
    expect(consultation.errors[:scheduled_at]).to include("can't be blank")
  end

  it 'is invalid without a user' do
    consultation = Consultation.new(scheduled_at: DateTime.now, user: nil, psychologist: psychologist)
    expect(consultation).to be_invalid
    expect(consultation.errors[:user]).to include("must exist")
  end

  it 'is invalid without a psychologist' do
    consultation = Consultation.new(scheduled_at: DateTime.now, user: user, psychologist: nil)
    expect(consultation).to be_invalid
    expect(consultation.errors[:psychologist]).to include("must exist")
  end

  it 'checks for time conflicts with other consultations' do
    consultation1 = Consultation.create!(scheduled_at: DateTime.now, user: user, psychologist: psychologist)
    consultation2 = Consultation.new(scheduled_at: DateTime.now, user: user, psychologist: psychologist)

    puts "Consultation 1 scheduled at: #{consultation1.scheduled_at}"
    puts "Consultation 2 scheduled at: #{consultation2.scheduled_at}"

    consultation2.valid?

    expect(consultation2.errors[:scheduled_at]).to include("conflicts with another consultation")
  end
end
