
# How to run SQL Commands locally
- This page covers how we can run sql commands in local machine with good understanding of how internally it works using Azure Data Studio.

## Pre Requisites
##### Following needs to be installed
1. Docker
    * for [Windows](https://docs.docker.com/desktop/windows/install/)
    * for [Mac](https://docs.docker.com/desktop/mac/install/)
2. Azure Data Studio
    * [Link to download](https://learn.microsoft.com/en-us/sql/azure-data-studio/download-azure-data-studio?view=sql-server-ver16&tabs=redhat-install%2Credhat-uninstall)

# Steps
1. Pull the Microsoft Sql Server docker image
```
docker pull mcr.microsoft.com/mssql/server
``````
2. Run the docker container with custom password
```
docker run -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=Thi$isMyPassw@rd' -p 1433:1433 -d mcr.microsoft.com/mssql/server
```
3. Open **Azure Data Studio** Software that is installed

    - Create new connection
        ![AzureDataStudioConnect](AzureDataStudioConnect.png)

    - Then click on connect
4. Load some sample datasets from Microsoft Official website
    [click here](https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver15&tabs=data-studio) 

![sample data sets](SampleDataSets.png)

5. Copying the file to your docker container
```
docker cp <location_of_file> <container_id>:/var/opt/mssql/data
```

Please check example below :

![Copy sample data sets](CopySampleDataSet.png)

6. Upload the dataset to Azure data studio

    a. Click restore
    ![click restore](ClickRestore.png)

    b. Select "Backup file" in dropdown for Restore from
    ![restore from backup](RestoreFromBackUp.png)

    c. Choose the Backup file path 
    ![choosefile](ChooseFile.png)

    d. Click Restore
    ![clickrestorefile](ClickRestoreFile.png)
7. Check the tables
    ![see all tables](SeeAllTables.png)

8. Click on **Enable Actual Plan** 
![click enable plan](ClickEnablePlan.png)

9. Lets run some sample query
```
-- NOTE: Please Highlight only one query to Run

set showplan_all off ; -- If showplan_all is "on" then we will not get Graph View instead we get Text View 


select 
    MONTH(ModifiedDate)
from 
    Sales.SalesOrderDetail
where 
    rowguid like '%f9%' 
order by 
    ModifiedDate;
```
Output:

![order of execution](../GraphView.png)

10. Lets run same query to get Text View with order of execution 

```
-- NOTE: Please Highlight only one query to Run

set showplan_all on ;


select 
    MONTH(ModifiedDate)
from 
    Sales.SalesOrderDetail
where 
    rowguid like '%f9%' 
order by 
    ModifiedDate;
```
Output:

![order of execution](../OrderOfExecution.png)

Thank you, Happy Coding :smile: