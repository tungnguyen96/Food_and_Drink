class Feedback < ApplicationRecord
  belongs_to :user

  validates :subject, presene: true,
    length: {maximum: Settings.feedback.length.subject_max_length}
  validates :detail, presene: true
end
