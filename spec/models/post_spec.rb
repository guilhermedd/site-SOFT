require 'rails_helper'
require 'shoulda/matchers'

RSpec.describe Post, type: :model do
  describe "associations" do
    it { should belong_to(:user) }
  end

  describe "validations" do
    it { should validate_inclusion_of(:public).in_array([true, false]) }
  end

  describe "methods" do
    let(:user) { create(:user) }
    let(:post) { create(:post, user: user) }

    it "returns the formatted date" do
      formatted_date = post.day

      expect(formatted_date).to be_a(String)
      expect(formatted_date).to eq(post.created_at.strftime("%d/%m/%Y"))
    end

    it "returns the formatted time" do
      formatted_time = post.time

      expect(formatted_time).to be_a(String)
      expect(formatted_time).to eq(post.created_at.strftime("%H:%Mh"))
    end
  end
end
