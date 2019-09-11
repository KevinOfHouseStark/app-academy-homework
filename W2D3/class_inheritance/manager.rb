require_relative "Employee"

class Manager < Employee
    attr_reader :employees
    def initialize(name,title,salary,boss)
        super(name,title,salary,boss)
        @employees = []
    end 

    def bonus(multiplier)
        self.total_subordinate_salary * multiplier
    end

    def total_subordinate_salary
        total = 0
        employees.each do |employee|
            if employee.is_a?(Manager)
                total += employee.salary + employee.total_subordinate_salary
            else
                total += employee.salary
            end
        end

        total
    end

    def add_employee(employee)
        employees << employee
        employee.boss = self
    end
end 