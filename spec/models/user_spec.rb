require 'rails_helper'

RSpec.describe User, type: :model do
  describe "associations" do
    it { should have_many(:posts).dependent(:destroy) }
    it { should have_many(:friends).class_name("Friend").with_foreign_key("friend_id") }
    it { should have_many(:consultations) }
  end

  describe 'validations' do
    let(:user) { FactoryBot.build(:user) }

    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:password) }
    it { expect(user.password_confirmation).to eq user.password }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end

  describe "devise modules" do
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:password_confirmation) }
  end
end
