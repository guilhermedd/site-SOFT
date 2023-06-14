class Consultation < ApplicationRecord
  belongs_to :user
  belongs_to :psychologist

  validates :scheduled_at, presence: true
  validate :check_time_conflicts

  def check_time_conflicts
    return if scheduled_at.nil?

    conflicts = Consultation.where(user_id: user_id, psychologist_id: psychologist_id)
                            .where.not(id: id)
                            .where('scheduled_at >= ? AND scheduled_at < ?', scheduled_at - 30.minutes, scheduled_at + 30.minutes)

    if conflicts.exists?
      errors.add(:scheduled_at, "conflicts with another consultation")
    end
  end
end
