class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  def active_for_authentication?
    super && approved?
  end

  def inactive_message
    if !approved?
      :not_approved
    else
      super # Use whatever other message
    end
  end

  def forem_name
    full_name
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def first_name
    "Colin"
  end

  def last_name
    "Rymer"
  end

  def address
    "123 somewhere"
  end
end
