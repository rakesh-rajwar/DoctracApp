class ImageSerializer < ActiveModel::Serializer
  attributes(
    :id,
    :name,
    :user_id,
    :url,
    :versions
  )

  def name
    object[:file]
  end

  def url
    object.file.url
  end

  def versions
    {
      thumb: object.file.url(:thumb),
      medium: object.file.url(:medium)
    }
  end
end
