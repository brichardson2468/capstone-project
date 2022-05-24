class SessionsController < ApplicationController

    def create 
        doctor = Doctor.find_by(username: params[:username])
        if doctor&.authenticate(params[:password])
            session[:doctor_id] = doctor.id
            render json: doctor, status: :created
        else
            render json: { error: {login: "Invalid username or password"}, status: :unauthorized }
        end
    end

    def destroy 
        session.delete :doctor_id
    end

    def current_user 
        doctor = Doctor.find_by(id: session[:doctor_id])
    end

end
