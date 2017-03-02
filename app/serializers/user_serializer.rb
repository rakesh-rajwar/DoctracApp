class UserSerializer < ActiveModel::Serializer
  attributes :email, :status, :responseMessage

  def responseMessage
  	"Account confirmation instructions sent to your email, please activate your account."
  end
end
