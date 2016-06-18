class ManagersController < ApplicationController



  def index
    @students = Student.all
    @student = Student.new
    @manager = Manager.new
    @ary = []
    if !request.method.nil?
      @class1 = "mdl-layout__tab"
      @class2 = "mdl-layout__tab is-active"
      @class3 = "mdl-layout__tab"
      @class4 = "mdl-layout__tab"
    end
  end


  def presence_or_absence
    students = Student.all
    i = 0
    students.each {|student|
      manager = Manager.find_by(student_id: student.id)
      manager.presence = params[:managers][i.to_s][:presence]
      manager.save
      manager.score = manager.score - 20 if manager.presence == false
      manager.save
      i += 1
    }

    redirect_to root_path
  end

  private

  def attendance_params
    params.require(:manager).permit(:id, :student_id, :presence)
  end

end
