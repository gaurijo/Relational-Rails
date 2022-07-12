class SchoolStudentsController < ApplicationController 
   def index
      @school = School.find(params[:school_id])
      if params[:sort] == "alpha"
         @students = @school.students.sort_by_name
      else
         @students = @school.students
      end
   end

   def new 
   end
   
   def create 
      # school = School.create(name: params[:name], national_rank: params[:national_rank], ap_program: params[:ap_program])
      # school.students.create(name: params[:name], class_rank: params[:class_rank], honor_roll: params[:honor_roll], school_id: params[:school_id])
      # redirect_to "/schools/#{school.id}/students"
   end

# private
#    def school_student_params 
#       params.permit(:name, :honor_roll, :class_rank, :school_id)
#    end
end