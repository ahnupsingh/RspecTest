class Contact < ApplicationRecord
  has_many :phones

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true, uniqueness: true

  def name
  [firstname, lastname].join(' ')
  end

  def self::by_letter(letter)
    return Contact.where("lastname LIKE ?","#{letter}%").order(:lastname).pluck(:lastname)
  end

end
