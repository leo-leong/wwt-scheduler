# wwt-scheduler
## Project Description
This solution contains a working prototype of a scheduler that is designed to invoke WCF Workflow service tools either ad hoc or scheduled in a daily, weekly and monthly basis. Having schedules contained in one repository enables you to coordinate tools to be scheduled for running against machines in an environment which is the main objective of the project.

The sample code is intended to demonstrate the use of WCF, Workflow, Entity Framework, ASP.NET MVC and LINQ to build an N-tier application. The solution is best suited to run within a server farm behind firewall. If you are looking for a scheduler capable of calling public HTTP endpoints over the internet, consider using the Azure Logic App.

## What's in the Bag
DispatchEngineService
This is essentially a WCF Workflow Service application with the core scheduling logic built using XAML and workflow. The application is meant to be stateless and uses Entity Framework Model First approach to define the data store schema in addition to storing and retrieving data in SQL.

## SchedulingStore
SQL Server Database project that contains the DDL SQL scripts to create the data store that houses the scheduling entities.

## SchedulingWebApp
ASP.NET MVC web application that serves as the GUI for users to create and maintain schedules in the data store.

## Scheduling
Basically the scheduling API library that uses Entity Framework Database First approach and encapsulates patterns such as repository and unit of work when working with data in SQL. Also uses IValidatableObject interface to enable business rules design and other validation needs.