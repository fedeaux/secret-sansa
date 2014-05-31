class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  before_validation(on: :create) do
    self.password = 'novo_usuario_instrutecnica'
    self.name = ''
    self.initials = ''
    self.disabled = false
  end
end
