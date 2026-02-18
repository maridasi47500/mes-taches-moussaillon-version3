class Proposal < ApplicationRecord
  translates :content
  has_many :votes, class_name: 'Proposalvalidation', foreign_key: "proposal_id"
  has_many :users, through: :votes, source: :user
  def notvoted(u)
    !votes.pluck(:user_id).index(u.id)
  end
  def myvotes
    if !await || await == "yes"
    votes
    elsif await == "no"
    negativevotes
    end
  end
  def ouiounon
    if !await || await == "yes"
    "oui"
    elsif await == "no"
    "non"
    end
  end
  def ouiounoninverse
    if !await || await == "yes"
    "non"
    elsif await == "no"
    "oui"
    end
  end

  def negativevotes
    votes.where(validated: false)
  end
  def negativeorpositivevotes
    if !await || await == "yes"
    negativevotes
    elsif await == "no"
    votes
    end
  end
  def negvotes
    if !await || await == "yes"
    User.where(id: negativevotes.pluck(:user_id))
    elsif await == "no"

    User.where(id: votes.pluck(:user_id))
    end
  end
end
