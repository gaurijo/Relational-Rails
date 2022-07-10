class SchoolsController < ApplicationController 
    def index 
        @schools = School.all.sort_by_created_at
    end
    
    def new 
    end

    def create 
        mango = School.create(name: params[:name], national_rank: params[:national_rank], ap_program: params[:ap_program])
        redirect_to "/schools"
    end

    def show 
        @school = School.find(params[:id])
    end


end