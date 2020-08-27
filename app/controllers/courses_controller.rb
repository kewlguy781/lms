class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :destory]
  
  def index
    @courses = Course.all
  end

  def show
    
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course(course_param)

  if @course.save
    redirect_to @course
  else
    render :new
  end
end

  def destroy
    @course.destory
    redirect_to courses_path
  end

  private

def set_course
  @course = Course.find(params[:id])
end

def course_params
params.require(:course).permit(:name)
end


end
