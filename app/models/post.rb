class Post < ApplicationRecord
  belongs_to :user

  validates :public, inclusion: { in: [true, false] }

  def day
    created_at.strftime("%d/%m/%Y")
  end

  def time
    created_at.strftime("%H:%Mh")
  end
end
