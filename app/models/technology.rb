class Technology < Thing
def self.myhardware
where.not(type:"Technology").length > 0
end
end
