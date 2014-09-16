class Contact
  include ActiveModel::Model

  validates :name, presence: true
  validates :email, presence: true, format: { with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/ }
  validates :comment, presence: true, length: { maximum: 800 }

  def persisted?
    false
  end
end
