class Article < ApplicationRecord
  has_many :comments, dependent: :destroy

  VALID_STATUSES = %w[public private archived].freeze

  validates :status, inclusion: { in: VALID_STATUSES }
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10, maximum: 300 }

  def archived?
    status == 'archived'
  end
end
e o
