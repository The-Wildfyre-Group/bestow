module Auth::Password
  extend ActiveSupport::Concern

  included do
    before_save :encrypt_password
  end

  def encrypt_password
    unless self.password.nil?
      self.password_digest = BCrypt::Password.create(self.password)
    end
  end

  def send_password_reset
    generate_token(:reset_password_token)
    self.reset_password_sent_at = Time.zone.now
    save!
    #SendEmail.password_reset(self).deliver
  end

end