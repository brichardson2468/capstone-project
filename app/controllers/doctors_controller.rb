class DoctorsController < ApplicationController

    def index
        render json: Doctor.all, status: :ok
    end
    
    def show
        if params[:id]
            doctor = Doctor.find(params[:id])
            render json: doctor, include: :patients
        end
    end








end
