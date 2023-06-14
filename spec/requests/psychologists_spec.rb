require 'rails_helper'

RSpec.describe Psychologist, type: :model do
  it 'is valid with a name' do
    psychologist = Psychologist.new(name: 'John Doe')
    expect(psychologist).to be_valid
  end

  it 'is invalid without a name' do
    psychologist = Psychologist.new(name: nil)
    expect(psychologist).to be_invalid
    expect(psychologist.errors[:name]).to include("can't be blank")
  end

  it 'has many consultations' do
    psychologist = Psychologist.new(name: 'Jane Smith')
    consultation1 = Consultation.new(scheduled_at: DateTime.now)
    consultation2 = Consultation.new(scheduled_at: DateTime.now + 1.hour)

    psychologist.consultations << consultation1
    psychologist.consultations << consultation2

    expect(psychologist.consultations).to include(consultation1, consultation2)
  end
end
