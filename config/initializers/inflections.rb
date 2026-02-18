# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format. Inflections
# are locale specific, and you may define rules for as many different
# locales as you wish. All of these examples are active by default:
ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.plural /^(ox)$/i, '\1en'
  inflect.singular /^(ox)en/i, '\1'
  inflect.irregular 'person', 'people'
  inflect.uncountable %w( news fish sheep )
end

# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.acronym 'RESTful'
# end
ActiveSupport::Inflector.inflections(:de) do |inflect|
  inflect.irregular 'hobby', 'hobbys'
  inflect.irregular 'guyacadeau', 'guyacadeaux'
  inflect.irregular 'beruf', 'berufe'
  inflect.irregular 'traumberuf', 'traumberufe'
  inflect.irregular 'personhassosie', 'personhassosies'
end
ActiveSupport::Inflector.inflections(:fr) do |inflect|
  inflect.irregular 'hobby', 'hobbys'
  inflect.irregular 'repas', 'repas'
  inflect.irregular 'traumberuf', 'traumberufe'
  inflect.irregular 'guyacadeau', 'guyacadeaux'
  inflect.irregular 'argent', 'argent'
  inflect.irregular 'selfie', 'selfies'
  inflect.irregular 'personhassosie', 'personhassosies'
end
ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.irregular 'hobby', 'hobbys'
  inflect.irregular 'guyacadeau', 'guyacadeaux'
  inflect.irregular 'sosie', 'sosies'
  inflect.irregular 'personhassosie', 'personhassosies'
  inflect.irregular 'traumberuf', 'traumberufe'
  inflect.irregular 'selfie', 'selfies'
  inflect.irregular 'repas', 'repas'
  inflect.irregular 'argent', 'argent'
  inflect.irregular 'bacseries', 'bacseries'
  inflect.irregular 'clothing', 'clothes'
  inflect.irregular 'specie', 'species'
  inflect.irregular 'epoch', 'epochs'
  inflect.irregular 'aime', 'aiment'
  inflect.irregular 'personne a', 'personnes ont'
  inflect.irregular 'personne est', 'personnes sont'
  inflect.irregular "n'aime pas", "n'aiment pas"
  inflect.irregular "ne comprend pas", "ne comprennent pas"
  inflect.irregular "pense que", "pensent que"
  inflect.irregular "a donné une note", "ont donné une note"
  inflect.irregular "a pensé", "ont pensé"
  inflect.irregular "a risqué", "ont risqué"
  inflect.irregular "est sauvé-e", "sont sauvé-e-s"
  inflect.irregular "a été", "ont été"
  inflect.irregular "a pris les risques", "ont pris les risques"
  inflect.irregular "est croyant-e", "sont croyant-e-s"
  inflect.irregular "inlove", "inloves"
  inflect.irregular "joue le rôle le plus", "jouent les rôles les plus"
  inflect.irregular "ne joue pas le rôle le plus", "ne jouent pas les rôles les plus"
  inflect.irregular 'criterion', 'criteria'
end
