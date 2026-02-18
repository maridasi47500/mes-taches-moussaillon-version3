
class Recipient < ApplicationRecord
  belongs_to :destinataire, class_name: 'Person', foreign_key:'person_id'
  belongs_to :post
end