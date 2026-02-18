class Mymenu < ApplicationRecord
self.table_name="forms"
has_and_belongs_to_many :webpages,:join_table=> :formshavewebpages
accepts_nested_attributes_for :webpages, allow_destroy: true
has_many :choicemenus
accepts_nested_attributes_for :choicemenus, update_only: true,allow_destroy: true
def withuser(u)
choicemenus.where(user_id: u.try(:id))
end
end
