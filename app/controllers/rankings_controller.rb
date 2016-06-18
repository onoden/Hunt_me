class RankingsController < ApplicationController

  def index
    @scores = []
    @students = []
    managers = Manager.all.order(score: :desc)
    managers.each {|manager|
      student = Student.find(manager.student_id)
      @students << student
    }
    if !request.method.nil?
      @class1 = "mdl-layout__tab"
      @class2 = "mdl-layout__tab"
      @class3 = "mdl-layout__tab"
      @class4 = "mdl-layout__tab is-active"
    end
  end

end
