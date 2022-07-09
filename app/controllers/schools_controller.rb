class SchoolsController < ApplicationController 
    def index 
        @schools = School.all.sort_by_created_at
    end
    
    def show 
        @school = School.find(params[:id])
    end
end