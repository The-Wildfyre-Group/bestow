module Auth::Signup
  extend ActiveSupport::Concern

  included do
    has_secure_password
    before_create { generate_token(:authentication_token) }
    after_create :send_welcome_email
    validates_presence_of :password, :on => :create

    %w[first_name last_name].each { |column| validates column.to_sym, :presence => true, length: {minimum: 2, maximum: 25} }
    validates_presence_of :email
  end

  module ClassMethods;end # end Class Methods

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def send_welcome_email
    #Mailer.welcome(user).deliver
  end
end