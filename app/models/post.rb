class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validates :title, presence: true, inclusion: { :in => :clickbait }
  # validates :title, presence: true, :in => ["won't believe", "secret", "top", "guess"].include?
end

  # validates_inclusion_of :title, :in => ["won't believe", "secret", "top", "guess"].include?




  def clickbait
    regex = [/(believe)|(secret)|(top)|(guess)/i/]
    regex.match?(title)
  end
end
