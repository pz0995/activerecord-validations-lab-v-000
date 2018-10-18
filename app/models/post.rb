class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validates :title, presence: true, :if => :clickbait?

  # %w(/won't|believe|secret|top|guess/i)


# ["%won't believe%", "%secret%", "%top guess%"]




  def clickbait?
    regex = /won\'t|believe|secret|top|guess/i\w+\n/g/
    regex.match(title) =! nil
  end
end
