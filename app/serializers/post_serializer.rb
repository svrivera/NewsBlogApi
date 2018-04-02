class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :subtitle, :body, :created_at

  def body
    if object.body.length > 500
      object.body[0, 497] + "..."
    else
      object.body
    end
  end
end
