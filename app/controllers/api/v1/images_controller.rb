class  Api::V1::ImagesController < ApiController

  # GET /api/v1/images/avatar, Fetch avatar image for a user
  def avatar
    image = current_resource_owner.avatar
    if image
      render json: image
    else
      e = image.errors.first
      error = e[0].to_s+" "+e[1].to_s rescue "Not saved"
      render json: {error: error}, status: :unprocessable_entity
    end
  end

  # POST /api/v1/images/avatar, Add an avatar image record for a user.
  def avatar_create
    image = current_resource_owner.images.find_or_initialize_by(tag: Image::AVATAR)
    image.tag << Image::AVATAR
    if image.update(image_params)
      render json: image, status: :created
    else
      e = image.errors.first
      error = e[0].to_s+" "+e[1].to_s rescue "Not saved"
      render json: {error: error}, status: :unprocessable_entity
    end
  end

  # GET /api/v1/images/photo_id, Fetch photo_id image for a user
  def photo_id
    image = current_resource_owner.photo_id
    if image
      render json: image
    else
      e = image.errors.first
      error = e[0].to_s+" "+e[1].to_s rescue "Not saved"
      render json: {error: error}, status: :unprocessable_entity
    end
  end

  # POST /api/v1/images/photo_id, Add an photo_id image record for a user.
  def photo_id_create
    image = current_resource_owner.images.find_or_initialize_by(tag: Image::PHOTO_ID)
    image.image_tag << Image::PHOTO_ID
    if image.save
      render json: image, status: :created
    else
      e = image.errors.first
      error = e[0].to_s+" "+e[1].to_s rescue "Not saved"
      render json: {error: error}, status: :unprocessable_entity
    end
  end

  private
  def image_params
    params.require(:image).permit(:file, :tag)
  end
end
