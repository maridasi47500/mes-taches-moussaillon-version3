class Proposalvalidation < ApplicationRecord
  belongs_to :proposal
  belongs_to :user
  translates :content
  validates_uniqueness_of :user_id, scope: :proposal_id
  def avoteouiounon
    validated ? "oui" : "non"
  end
end
