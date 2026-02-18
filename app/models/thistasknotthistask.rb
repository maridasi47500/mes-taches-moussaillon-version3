class Thistasknotthistask < ApplicationRecord
belongs_to :task
belongs_to :othertask, class_name: 'Task'
def self.taskdifferetactions
joins('left join tasks mytasks on mytasks.id = thistasknotthistasks.task_id or mytasks.id = thistasknotthistasks.othertask_id').joins('left join taskshaveactions att on att.task_id = mytasks.id').joins('left join actions taskactions on taskactions.id = att.action_id').select('att.*, taskactions.*,mytasks.*,mytasks.name_'+I18n.locale.to_s+' as taskname,mytasks.id as taskid, taskactions.name_'+I18n.locale.to_s+' as taskactionname').group('taskactions.id').group_by {|x| x.taskactionname}.to_a.combination(2).to_a
end


def self.findbyid(i)
where(id: i)
end
def self.findbyname(n)
if n.to_s.squish.strip.length >= 3
      str="%#{n.to_s.squish.strip.gsub(' ','%')}%"

joins('left join people p2 on p2.id = thistasknotthistasks.otherperson_id').joins('left join people p1 on p1.id = thistasknotthistasks.person_id').where(["p1.name like ? or p2.name like ? or p2.firstnames like ? or p2.description like ? or p2.lastname like ? or p1.firstnames like ? or p1.lastname like ? or (p1.name || ' ' || p1.firstnames || ' ' || p1.lastname || ' ' || p2.name || p2.firstnames || p2.lastname) like ? or (p2.name || ' ' || p2.firstnames || ' ' || p2.lastname || ' ' || p1.name || p1.firstnames || p1.lastname) like ?"]+Array.new(9,str)).select("p1.name as person1, p2.name as person2,thistasknotthistasks.id as twopersonid")
end
end

end
