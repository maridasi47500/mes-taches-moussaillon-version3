class Company < Thing
has_many :companieshaveceos
has_many :ceos, through: :companieshaveceos, source: :ceo
has_many :companieshaveemployeehaveemployers
has_many :employees, through: :companieshaveemployeehaveemployers, source: :employee
has_many :companieshaveemployees
has_many :employers, through: :companieshaveemployees, source: :employee
has_many :companieshavecustomers
has_many :customers, through: :companieshaveemployees, source: :employee
def self.findbyname(n)
      o='%'+n.gsub(' ','%').downcase+'%'

        where(["lower(name_en) like ? or lower(name_fr) like ? or lower(name_de) like ?",o,o,o])
end

def self.findbyid(i)
where(id: i)
end
def tickets
m=(customer_ids+employer_ids+ceo_ids).uniq
str=""
n=[]
comb=[]
m.combination(2).each do |k,l|
n.push("(s.sender_id in (?) and r.recipient_id in (?))")
n.push("(s.sender_id in (?) and r.recipient_id in (?))")
comb.push([k,l,l,k])
end
p n
p comb
if n.length > 0
Ticket.joins("left join ticketshaverecipients r on r.ticket_id = tickets.id").joins("left join ticketshavesenders s on s.ticket_id = tickets.id").select(' r.*, s.*,tickets.*').where([n.join(' or ')]+comb.flatten)
else
[]
end

end

  
end
