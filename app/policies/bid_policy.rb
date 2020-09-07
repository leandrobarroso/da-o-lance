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
    record.auction.deadline > Time.now && record.seller == user.seller
  end

  def update?
    record.seller == user.seller
  end

  def show?
    if record.auction.deadline > Time.now
      record.auction.user == user || record.seller == user.seller
    else
      record.auction.user == user || user.seller
    end
  end
end
