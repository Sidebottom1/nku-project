class Baker < ActiveRecord::Base
  has_secure_password
  validates_presence_of :password, :on => :create
  validates :email, :uniqueness => true
  before_save { |baker| baker.email = baker.email.downcase }
  
  def self.email_addresses
    all.map do |baker|
      baker.email
    end
  end

end