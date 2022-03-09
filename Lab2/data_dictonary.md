### Cars
|Field Name|Data Type|Constraint|Description|
|-----------|---------|------------|-----------|
|Car_ID|INT|Primary Key|Car ID, Auto generated|
|Year|INT|Not null|Year of car|
|Make|TEXT|Not null|Make of car|
|Model|TEXT|Not null|Model of car|
|Name|TEXT|Not null|Name of owner of car|
|Email|TEXT|Not null|Email address of owner of car|





### Judges
|Field Name|Data Type|Constraint|Description|
|-----------|---------|------------|-----------|
|Judge_ID|INT|Primary Key|Judge ID, Auto generated|
|Judge_Name|INT|Not null|Name of udge|


### Car_Score
|Column Name|Data Type|Constraint|Description|
|-----------|---------|---------|-----------|
|Car_ID|INT|Primary Key|Car ID, Auto generated|
|Racer_Turbo|INT|Not null|Score for the racer turbo of car|
|Racer_Supercharged|INT|Not null|Score for the racer supercharged of car|
|Racer_Performance|INT|Not null|Score for the racer performance of car|
|Racer_Horsepower|INT|Not null|Score for the racer horsepower of car|
|Engine_Modifications|INT|Not null|Score for the engine modifications of car|
|Engine_Performance|INT|Not null|Score for the engine performance of car|
|Engine_Chrome|INT|Not null|Score for the engine chrome of car|
|Engine_Detailing|INT|Not null|Score for the engine detailing of car|
|Engine_Cleanliness|INT|Not null|Score for the engine cleanliness of car|
|Body_Frame_Undercarriage|INT|Not null|Score for the body frame undercarriage of car|
|Body_Frame_Suspension|INT|Not null|Score for the body frame suspension of car|
|Body_Frame_Chrome|INT|Not null|Score for the body frame chrome of car|
|Body_Frame_Detailing|INT|Not null|Score for the body frame detailing of car|
|Body_Frame_Cleanliness|INT|Not null|Score for the body frame cleanliness of car|
|Mods_Paint|INT|Not null|Score for the paint modification of car|
|Mods_Body|INT|Not null|Score for the body modification of car|
|Mods_Wrap|INT|Not null|Score for the wrap modification of car|
|Mods_Rims|INT|Not null|Score for the rims modification of car|
|Mods_Interior|INT|Not null|Score for the interior modification of car|
|Mods_Other|INT|Not null|Score for the other modifications of car|
|Mods_ICE|INT|Not null|Score for the ICE modifications of car|
|Mods_Aftermarket|INT|Not null|Score for the aftermarket modifications of car|
|Mods_WIP|INT|Not null|Score for the WIP modifications of car|
|Mods_Overall|INT|Not null|Score for the overall modifications of car|


### extract1
|Field Name|Data Type|Constraint|Description|
|-----------|---------|------------|-----------|
|Rank|INT|Not null|Rank of car based on the total scores|
|Car_ID|INT|Not null|Car ID, Auto generated|
|Year|INT|Not null|Year of car|
|Make|TEXT|Not null|Make of car|
|Model|TEXT|Not null|Model of car|
|Score|TEXT|Not null|Total score of car|


### extract2
|Field Name|Data Type|Constraint|Description|
|-----------|---------|------------|-----------|
|Rank|INT|Not null|Rank of car based on the total scores|
|Car_ID|INT|Primary Key|Car ID, Auto generated|
|Year|INT|Not null|Year of car|
|Make|TEXT|Not null|Make of car|
|Model|TEXT|Not null|Model of car|
|Name|TEXT|Not null|Name of owner of car|
|Email|TEXT|Not null|Email address of owner of car|



### extract3
|Column Name|Data Type|Constraint|Description|
|-----------|---------|---------|-----------|
|Judge_ID|TEXT|Not null|Unique ID identifying judge|
|Judge_Name|TEXT|Not null|Name of judge|
|Total_Cars|INT|Not null|Number of cars judged by judge|
|Start_Timestamp|DATETIME|Not null|First timestamp of each judge's judging for the day|
|End_Timestamp|DATETIME|Not null|Final timestamp of each judge's judging for the day|
|Duration_Minutes|INT|Not null|Duration (in minutes) between start and end times for judge|
|Average|INT|Not null|Average speed (in minutes per car) for judge|
