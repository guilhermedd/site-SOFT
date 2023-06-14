require 'rails_helper'

RSpec.describe Psychologist, type: :model do
  describe "associations" do
    it { should have_many(:consultations) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
  end
end
