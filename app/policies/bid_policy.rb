class BidPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    true
  end

  def edit?
    record.seller == user.seller
  end

  def update?
    record.seller == user.seller
  end

  def show?
    record.auction.user == user
  end
end
