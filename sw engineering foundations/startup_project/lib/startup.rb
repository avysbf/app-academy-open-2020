require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees

    def initialize (name, funding, salaries)
        @name, @funding, @salaries = name, funding, salaries
        @employees = [] 
    end

    def valid_title?(title)
        self.salaries.key?(title)
    end

    def >(start_up)
        self.funding > start_up.funding
    end

    def hire(name, title)
        if !self.valid_title?(title)
            raise "Error."
        else
            @employees << Employee.new(name, title)
        end
    end

    def size
        self.employees.count
    end

    def pay_employee(emp)
        amt = salaries[emp.title]

        if @funding > amt
            emp.pay(amt)
            @funding -= amt
        else
            raise "We're broke."
        end
    end

    def payday
        employees.each {|e| pay_employee(e)}
    end

    def average_salary
        titles = []
        employees.each {|e| titles << e.title}
        total = 0
        titles.each {|t| total += salaries[t]}
        avg = total / titles.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire (stup)
        @funding += stup.funding
        @employees += stup.employees
        stup.salaries.each do |title, sal|
            if valid_title?(title)
                next
            end
            @salaries.store(title, sal)
        end
        stup.close
    end
end
