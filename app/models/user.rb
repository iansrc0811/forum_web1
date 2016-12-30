class User < ActiveRecord::Base
  
  has_many :lists, dependent: :destroy
  has_many :articles, through: :lists, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :first_name, :last_name, :nick_name

  def full_name
    last_name.upcase + " " + first_name.upcase
  end
  
end
