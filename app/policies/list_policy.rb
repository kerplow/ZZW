class ListPolicy < ApplicationPolicy
  def create?
    !!user
  end

  def update?
    return false unless user
    user.admin? or record.user == current_user
  end

  def destroy?
    return false unless user
    user.admin? or record.user == current_user
  end

  class Scope < Scope
    def resolve
      return scope.only_public unless user
      if user.admin?
        scope.includes(:options)
      else
        scope.includes(:options)#.where(options: { list: { allowed_voters: user } })
      end
    end
  end
end
