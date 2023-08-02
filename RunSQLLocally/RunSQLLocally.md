
# How to run SQL Commands locally
- This page covers how we can run sql commands in local machine with good understanding of how internally it works using Azure Data Studio.

## Pre Requisites
##### Following needs to be installed
1. Docker
    * for [Windows](https://docs.docker.com/desktop/windows/install/)
    * for [Mac](https://docs.docker.com/desktop/mac/install/)
2. VS Code
    * [Download link](https://code.visualstudio.com/download)

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


Thank you, Happy Coding :smile: