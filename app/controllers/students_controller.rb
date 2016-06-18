class StudentsController < ApplicationController
def index
  if !request.method.nil?
      @class1 = "mdl-layout__tab"
      @class2 = "mdl-layout__tab"
      @class3 = "mdl-layout__tab"
      @class4 = "mdl-layout__tab"
  end
end

  def new
    @student = Student.new
    if !request.method.nil?
      @class1 = "mdl-layout__tab is-active"
      @class2 = "mdl-layout__tab"
      @class3 = "mdl-layout__tab"
      @class4 = "mdl-layout__tab"
    end
  end

  def show
    @user = User.new
  end

  def create
    @student = Student.new(student_params)
    #バリデーション
    if @student.save == true
      manager = Manager.new
      #studentとmanagerを関連付ける
      @student.manager = manager
      user_id = current_user.id
      @student.user_id = user_id
      @student.save
      redirect_to root_path
    else
      if !request.method.nil?
        @class1 = "mdl-layout__tab is-active"
        @class2 = "mdl-layout__tab"
        @class3 = "mdl-layout__tab"
        @class4 = "mdl-layout__tab"
      end

      render "new"
    end
  end

  # #生徒の詳細を表示
  # def show
  #   @registration = Student.find(params[:id])
  # end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to shukketu_path
  end

  private

  def student_params
    params.require(:student).permit(:name, :student_id, :image)
  end

end

