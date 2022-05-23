class DoctorsController < ApplicationController

    def index
        doctors = Doctor.all
        render json: doctors, status: :ok
    end
    
    def show
          doctor = Doctor.find(params[:id])
        if doctor  
            render json: DoctorSerializer.new(doctor).as_json, status: :ok
        else
            render json: {message: "Doctor with id #{params[:id]} not found"}, status: 404
        end
    end
end