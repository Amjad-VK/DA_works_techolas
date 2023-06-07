class emply:
    def __init__(self,id,name,salary):
        self.emp_id=id
        self.emp_name=name
        self.emp_salary=salary
    def getfunc(self):
        print(self.emp_id,self.emp_name,self.emp_salary)

obj1=emply(100,"AMJAD",35000)
obj1.getfunc()