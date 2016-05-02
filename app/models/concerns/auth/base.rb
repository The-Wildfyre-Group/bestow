module Auth::Base
  extend ActiveSupport::Concern

  included do
    include Auth::Signup
    include Auth::Password
  end
end