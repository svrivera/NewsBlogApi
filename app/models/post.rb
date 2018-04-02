#https://stackoverflow.com/questions/2572284/how-to-override-to-json-in-rails?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa

class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, presence: true
  validates :body, presence: true

  def as_json(options={})
    opts = {:only => [:id, :title, :subtitle, :body, :created_at]}
    super(options.merge(opts))
  end
end
