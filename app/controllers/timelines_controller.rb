class TimelinesController < ApplicationController

  def index
    @students = Student.all
    if !request.method.nil?
      @class1 = "mdl-layout__tab"
      @class2 = "mdl-layout__tab"
      @class3 = "mdl-layout__tab is-active"
      @class4 = "mdl-layout__tab"
    end
  end

end
