class Googleresult < ApplicationRecord
  has_and_belongs_to_many :google_requests, :join_table => :googleresultsofgooglerequests
  def semiurl
    self.url[7..-1] || ""
  rescue NoMethodError
    ""
  end
end
