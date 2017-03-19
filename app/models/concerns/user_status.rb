module Concerns::UserStatus
  extend ActiveSupport::Concern

    def change_user_status
      if self.user.status != "ONBOARDING_COMPLETE"
        self.user.update(status: "#{self.class.name.upcase}_COMPLETE")
      end
    end
end