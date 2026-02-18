module JsonhelperHelper
def json_allthewebsites
@websites=Website.findbyname(params[:name])
end
def allthetvserieshaveactors
@tvserieshaveactors=Tvserieshaveactor.findbyname(params[:name])
end
def json_requestsperson
@requeststopeople=Requeststoperson.findbyname(params[:name])
end
end
