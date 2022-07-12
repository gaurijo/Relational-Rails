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
   
   
end