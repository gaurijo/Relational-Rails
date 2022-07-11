class StudentsController < ApplicationController
   def index 
      @students = Student.all
   end

   def show 
      @student = Student.find(params[:id])
   end

   def edit
      @student = Student.find(params[:id])
   end

   def update 
      @student = Student.find(params[:id])
      @student.update(student_params)
      redirect_to "/students/#{@student.id}"
   end

private 
   def student_params
      params.permit(:name, :class_rank, :honor_roll)
   end
end