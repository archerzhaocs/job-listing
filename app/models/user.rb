class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :resumes

  def admin?
   #is_admin
   #@user = User.find(params[:id])
   email == 'admin@pets-care.com'
  end

end
