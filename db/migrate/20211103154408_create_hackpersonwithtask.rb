class CreateHackpersonwithtask < ActiveRecord::Migration[6.0]
  def change

    create_table :listhackedi18nphrases do |t|
t.integer :post_id
t.integer :i18nphrase_id
    end
    create_table :listhackedhernothers do |t|
t.integer :post_id
t.integer :hernother_id
    end
#how?
    create_table :listhackedthistasknotthistasks do |t|
t.integer :post_id
t.integer :thistasknotthistask_id
    end
#ce que tu veux qui fasse la rumeur de journaux
#rumeur voulue
#ticket
#detail tache

#rmeur qui ne correspond pas a la tache dans cette epoque
#rmeur qui correspond a la tache dans cette epoque
create_table :taskhaveepochs do |t|
t.integer :task_id
t.integer :epoch_id
end


  end
end
