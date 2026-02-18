class LaundrycaptainsController < ApplicationController
  def show
@laundry=Laundryjiramaperson.find(params[:laundryjiramaperson_id])
@coloc=Laundrycaptain.find(params[:id])
  end
end
