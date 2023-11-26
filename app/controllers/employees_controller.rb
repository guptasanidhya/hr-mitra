class EmployeesController <ApplicationController

#it is used to take some parameters before performing a controller action
before_action :set_employee, only:[:edit, :update,:show, :destroy]

    def index
    @employees=Employee.all
    end

    def new 
        #instantiate modal class singular value(employee not employees) (gave me error for 2 hours)
        @employee = Employee.new
    end

    def create
        @employee = Employee.new(employee_params)
        if @employee.save
            redirect_to employees_path, notice:"employee has been created successfully"
        else
            render :new
        end
    end

    def edit
        # @employee=Employee.find(params[:id])
    end

    def update
        # @employee=Employee.find(params[:id])
        if @employee.update(employee_params)
            redirect_to employees_path, notice: 'Employee was successfully updated'
        else
            render :edit
        end
    end

    def show 
        # @employee=Employee.find(params[:id])
    end

    def destroy
        # @employee=Employee.find(params[:id])
        if @employee.destroy
            redirect_to employees_path, notice: "Employee has been deleted successfully"
        end
    end

    #traditional method inside create 
    # first_name: params[:employee][:first_name],
    # last_name: params[:employee][:last_name],
    #         personal_email: params[:employee][:personal_email],
    #         city: params[:employee][:city],
    #         state: params[:employee][:state],
    #         country: params[:employee][:country],
    #         pincode: params[:employee][:pincode],
    #         address_line_1: params[:employee][:address_line_1]
    private
    
    def employee_params
        params.require(:employee).permit(:first_name, :middle_name, :last_name,:personal_email, :city,:state,:country,:pincode,:address_line_1,:address_line_2,:job_title,:date_of_joining,:date_of_birth,:about)
    end

    def set_employee
        @employee=Employee.find(params[:id])
        #using to show error to same page as we know thats called exception handling
    rescue ActiveRecord::RecordNotFound =>error
        redirect_to employees_path, notice: error
    end
end