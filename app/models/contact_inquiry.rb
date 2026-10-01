class ContactInquiry
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :name, :string
  attribute :email, :string
  attribute :message, :string

  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :message, presence: true
  validates :name, length: { maximum: 100 }
  validates :message, length: { maximum: 5_000 }

  def persisted?
    false
  end
end
