class Post < ActiveRecord::Base
   
    validates :title, presence: true
    validates :content, length: {minimum: 10}
    validates :summary, length: {maximum: 10}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :title_clickbait_checker

    CLICKBAIT = [
        "Won't Believe",
        "Secret",
        "Top[number]",
        "Guess"
    ]

    def title_clickbait_checker
        if title.present? && CLICKBAIT.none? {|p| title.match(p)}
            errors.add(:title, "title not clickbait-y enough")
        end
    end

end
