class SchoolsController < ApplicationController 
    def index 
        @schools = School.all.sort_by_created_at
    end
    
    def new 
    end

    def create 
        mango = School.create(school_params)
        redirect_to "/schools"
    end

    def edit
        @school = School.find(params[:id])
    end

    def show 
        @school = School.find(params[:id])
    end

    def update 
        @school = School.find(params[:id])
        @school.update(school_params)
        redirect_to "/schools/#{@school.id}"
    end

    def destroy 
        school = School.find(params[:id])
        school.destroy
        redirect_to '/schools'
    end

private
    def school_params 
        params.permit(:name, :national_rank, :ap_program)
    end
end