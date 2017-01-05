class ListPolicy < ApplicationPolicy

  def update?
    if user
      user_or_admin
    else
      false
    end
  end

  private
    def user_or_admin
      
      record.user_id == user.id || admin?

    end
    def admin?
      admin_types.include?(user.type)
    end
end