class Container < ActiveRecord::Base
  has_many :links
  belongs_to :creator, class_name: "User"
  # validates :name, presence: true
  validates :name, length: { in: 4..20 }

  def staging?
    link == "fc1e8c208ae63daf22f7659"
  end

  def created_by?(user)
    creator == user
  end
end
