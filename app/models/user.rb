class User < ApplicationRecord
  rolify
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

       has_many :appointments
       has_many :doctors
       after_create :assign_default_role     

      def assign_default_role
       self.add_role(:newuser) if self.roles.blank?
      end


end       

