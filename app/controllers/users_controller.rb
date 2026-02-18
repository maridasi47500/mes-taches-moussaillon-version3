class UsersController < ApplicationController
def myjobs
@job=Job.find(params[:id])
render layout: false
end
def myjobstext
@job=Job.find(params[:id])
render layout: false
end
def mysectorstext
@sector=Sector.find(params[:id])
render layout: false
end
def mysectors
@sector=Sector.find(params[:id])
render layout: false
end
def show
@user=User.find(params[:id])
end
end
