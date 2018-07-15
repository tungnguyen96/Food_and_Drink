class Feedback < ApplicationRecord
  belongs_to :user

  validates :subject, presence: true,
    length: {maximum: Settings.feedback.subject.maximum}
  validates :detail, presence: true
end
