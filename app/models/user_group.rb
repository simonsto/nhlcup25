class UserGroup < ApplicationRecord
  has_many :users

  validates :name, :slug, presence: true, uniqueness: true
  validates :invite_code, uniqueness: true, allow_nil: true

  before_validation :generate_slug, on: :create
  before_create :generate_invite_code, if: -> { is_private }

  belongs_to :creator, class_name: "User", optional: true

  MAX_GROUP_SIZE = 10

  def full?
    users.count >= MAX_GROUP_SIZE
  end

  def total_score
    users.sum(:score)
  end

  def average_score
    users.any? ? (total_score.to_f / users.size).round(2) : 0
  end

  def self.joinable(code_or_slug)
    find_by(invite_code: code_or_slug) || find_by(slug: code_or_slug)
  end

  private

  def generate_slug
    self.slug = name.parameterize if slug.blank?
  end

  def generate_invite_code
    self.invite_code = SecureRandom.hex(4)
  end
end
