class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :delivery_addresses

  def soft_delete
    update(deleted_at: Time.now)
  end

  def active_for_authentication?
    !deleted_at
  end

  def inactive_message
    !deleted_at ? super : :deleted_account
  end

end
