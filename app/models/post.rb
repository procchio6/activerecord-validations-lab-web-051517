class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }
  validate :clickbaity

  def clickbaity
    if !title.nil?
      if title.match(/(Won't Believe)|(Secret)|(Top\s\d+)|(Guess)/).nil?
        errors.add(:clickbaity, 'Title must be clickbaity!')
        false
      end
    else
      false
    end
  end
end
