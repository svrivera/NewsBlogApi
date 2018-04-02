class Comment < ApplicationRecord
  validates :author, presence: true
  validates :comment, presence: true
  belongs_to :post
  attr_readonly :id, :created_at

  def as_json(options={})
    opts = {:only => [:id, :author, :comment, :created_at]}
    super(options.merge(opts))
  end
end
