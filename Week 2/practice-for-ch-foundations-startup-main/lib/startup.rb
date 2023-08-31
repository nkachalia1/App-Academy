require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, title_salary_hash)
        @name = name
        @funding = funding
        @salaries = title_salary_hash
        @employees = []
    end

    def valid_title?(title)
        @salaries.has_key?(title)
    end

    def >(another_startup)
        self.funding > another_startup.funding
    end

    def hire(name, title)
        if self.valid_title?(title)
            @employees << Employee.new(name, title)
        else
            raise "Title is invalid"
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        money_owed = @salaries[employee.title]
        if @funding > money_owed
            employee.pay(money_owed)
            @funding -= money_owed
        else
            raise "Not enough funding"
        end
    end

    def payday
        @employees.each do |employee|
            self.pay_employee(employee)
        end
    end

    def average_salary
        total = 0
        @employees.each do |employee|
            total += @salaries[employee.title]
        end

        (1.0 * total) / size
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(another_startup)
        @funding += another_startup.funding
        another_startup.salaries.each do |title, salary|
            if !@salaries.has_key?(title)
                @salaries[title] = salary
            end
        end
        @salaries

        @employees += another_startup.employees
        another_startup.close
    end
end
