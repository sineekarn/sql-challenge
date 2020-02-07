-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/lzckK9
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [Departments] (
    [dept_no] varchar(30)  NOT NULL ,
    [dept_name] varchar(30)  NOT NULL ,
    CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED (
        [dept_no] ASC
    )
)

CREATE TABLE [Employees] (
    [emp_no] int  NOT NULL ,
    [birth_date] date  NOT NULL ,
    [first_name] varchar(30)  NOT NULL ,
    [last_name] varchar(30)  NOT NULL ,
    [gender] varchar(10)  NOT NULL ,
    [hire_date] date  NOT NULL ,
    CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED (
        [emp_no] ASC
    )
)

CREATE TABLE [Dpt_Emp] (
    [emp_no] int  NOT NULL ,
    [dept_no] varchar(30)  NOT NULL ,
    [from_date] date  NOT NULL ,
    [to_date] date  NOT NULL 
)

CREATE TABLE [Dpt_Manager] (
    [dept_no] varchar(30)  NOT NULL ,
    [emp_no] int  NOT NULL ,
    [from_date] date  NOT NULL ,
    [to_date] date  NOT NULL 
)

CREATE TABLE [Salaries] (
    [emp_no] int  NOT NULL ,
    [salary] int  NOT NULL ,
    [from_date] date  NOT NULL ,
    [to_date] date  NOT NULL 
)

CREATE TABLE [Titles] (
    [id_serial] int  NOT NULL ,
    [emp_no] int  NOT NULL ,
    [title] varchar(30)  NOT NULL ,
    [from_date] date  NOT NULL ,
    [to_date] date  NOT NULL ,
    CONSTRAINT [PK_Titles] PRIMARY KEY CLUSTERED (
        [id_serial] ASC
    )
)

ALTER TABLE [Dpt_Emp] WITH CHECK ADD CONSTRAINT [FK_Dpt_Emp_emp_no] FOREIGN KEY([emp_no])
REFERENCES [Employees] ([emp_no])

ALTER TABLE [Dpt_Emp] CHECK CONSTRAINT [FK_Dpt_Emp_emp_no]

ALTER TABLE [Dpt_Emp] WITH CHECK ADD CONSTRAINT [FK_Dpt_Emp_dept_no] FOREIGN KEY([dept_no])
REFERENCES [Departments] ([dept_no])

ALTER TABLE [Dpt_Emp] CHECK CONSTRAINT [FK_Dpt_Emp_dept_no]

ALTER TABLE [Dpt_Manager] WITH CHECK ADD CONSTRAINT [FK_Dpt_Manager_dept_no] FOREIGN KEY([dept_no])
REFERENCES [Departments] ([dept_no])

ALTER TABLE [Dpt_Manager] CHECK CONSTRAINT [FK_Dpt_Manager_dept_no]

ALTER TABLE [Dpt_Manager] WITH CHECK ADD CONSTRAINT [FK_Dpt_Manager_emp_no] FOREIGN KEY([emp_no])
REFERENCES [Employees] ([emp_no])

ALTER TABLE [Dpt_Manager] CHECK CONSTRAINT [FK_Dpt_Manager_emp_no]

ALTER TABLE [Salaries] WITH CHECK ADD CONSTRAINT [FK_Salaries_emp_no] FOREIGN KEY([emp_no])
REFERENCES [Employees] ([emp_no])

ALTER TABLE [Salaries] CHECK CONSTRAINT [FK_Salaries_emp_no]

ALTER TABLE [Titles] WITH CHECK ADD CONSTRAINT [FK_Titles_emp_no] FOREIGN KEY([emp_no])
REFERENCES [Employees] ([emp_no])

ALTER TABLE [Titles] CHECK CONSTRAINT [FK_Titles_emp_no]

COMMIT TRANSACTION QUICKDBD