class UserSerializer < ActiveModel::Serializer
  attributes :email, :status, :responseMessage

  def responseMessage
  	"Account confirmation instructions sent to your email. Please check your email for a link to confirm email."
  end
end
