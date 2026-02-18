class Restaurant < Place
def self.findbycityid(j)
where(city_id: j)
end
end
