class ListPolicy < ApplicationPolicy

  def update?
    if user
      user_or_admin
    else
      false
    end
  end

  def create?
    if user
      true
    else
      false
    end
  end

  private
    def user_or_admin
      if
        record.user_id == user.id || admin?
        true
      else
        false
      end
    end
    
    def admin?
      admin_types.include?(user.type)
    end
end