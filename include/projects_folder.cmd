if exist %SystemDrive%\Projects SET "where_projects=%SystemDrive%\Projects"
if exist %SystemDrive%\Projetos SET "where_projects=%SystemDrive%\Projetos"
if not defined where_projects SET "where_projects=%SystemDrive%\Projects" & mkdir "%where_projects%"
