class EmployeesController < ApplicationController
  def create
    parameters = employee_params
    area = parameters[:area]
    parameters[:area] = Area.find(area)

    @employee = Employee.new(parameters)
    @employee.company_id = params[:company_id]
    @employee.save
    redirect_to company_path(params[:company_id])
  end

  def destroy
   @employee = Employee.find(params[:id])
   @employee.destroy()
   redirect_to company_path(params[:company_id])
 end

  private
  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :email, :area)
  end
end
