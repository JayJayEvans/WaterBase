# WaterBase

**Project: Water Data Management**

**Expert User: Wayne Hamilton, Department of GeoSciences, Baylor University (** [**Wayne\_Hamilton@baylor.edu**](mailto:Wayne_Hamilton@baylor.edu)**)**

**Project description**

Increasing demands for water, especially near urban areas has caused a renewed interest in the under-utilized Brazos River Alluvium Aquifer (BRAA).  The BRAA presents unique management challenges due to the thickness variability, fluctuating water levels, and proximity to surface sources of contamination.  Therefore, BRAA data is important to make effective water management decisions that benefit the community. In this project you are to build a database application that allowing storage and retrieval of the data, as well as enable some simple analysis to be performed.

**Data Description**

Along the aquifer there are wells which are built to access the water. Some wells have transducers which will periodically measure the various water quality. Your main task is to manage and store those information in your database.

**Wells**

Each well is assigned a unique numeric identifier by the state. Each well also has a (non-unique) aquifer code associated with it. Each well has a type code – which is a single uppercase numeric character.

Some wells has an &quot;owner&quot; – which may be a person, a company or a government agency. For each owner, we need to record its type and its name, and assign a unique ID to it. Notice that different owners may have the same name.

We would need to record the location information of the well. This include its latitude and longitude, as well as the county and state that the well is located. We also need to record the depth of the well.

For each well, we want to record its usage. For this project, we define usage to be one of the following: unused, stock, domestic, irrigation.

Some wells have pumps. If that is the case, we need to record a description of the type of the pump.

For each well, we need to record the elevation of the well (from sea level). We record 3 elevations: elevation of the bottom of the well, elevation of the water level and elevation of the land surface. Notice that the elevation of water level is not always available (the other two are always available).

Some wells also have the following numerical data available: CasingID, Diameter, Top Depth and Bottom depth.

For each well there should also be a remarks field to allow user to enter extra (textual) information about the wells.

**Transducers**

Many wells have transducers which allow monitor of water properties. Each transducer has a unique identifier. It also has a type (represented by an alphanumeric string) and a (not necessarily unique) name. It should also record the well that it is associated with.

Once placed, a transducer will start record 5 different (numeric) attributes of the water: temperature, conductivity, pressure, salinity and TDS. The system should record the time that the values are recorded, as well as the values themselves. While in general measurements are recorded at fixed intervals, there is not always necessary.

**Rainfall info**

One goal of the system is to analysis the water level of the wells with the rainfall. The National Weather Service provide information about rainfall in the United States. For now, we can retrieve the actual amount of rainfall at a certain location (latitude, longitude) for a given day. It can also provide the &quot;normal amount of rainfall&quot; for that location for any given day. We will like to store those info.

**Tasks**

Your system should allow the user to achieve the following tasks

- Data input. You should allow two modes of data input:
  - Interactive: you should provide the user an interface to enter all the information above.
  - File upload: there are two kinds of file upload you should support
    - Well data: the user will provide a file contains information about a list of wells. Each line corresponds to data about a well.
    - Sensor reading data: the user will provide information about readings from a single sensor. The GUI should ask the user to specify the sensor.

In each case, you can assume the file to be a comma delimited file (fields are delimited by commas). You should allow the user to specify which field in the file corresponds to which fields in the database. Notice that there may be more fields in the input file then necessary, in such case those extra fields is ignored. If there is not enough fields, then you should alert the user that the file format does not work.

- Query/Analysis. The following queries are to be supported

- Well query: Find the list of the well given one (or more) of the following criteria
    - Unique ID
    - Aquifer code
    - Type code
    - Owner

You should display the relevant information about the well, including sensor info (if there is a sensor associated with it – only need to display information in the first two paragraphs about sensors)

If multiple criteria is selected, it is consider an conjunction (AND) – same as below

- Transducer readings:

The user can specify a sensor using either its unique ID or the well it is associated with, and also enter a time range (begin and end) and you should output all readings made by that sensor in chronological order (in a tabular format)  If there are readings, the user can also have the option of downloading the readings into a csv file (the user need to provide a file name). The user can also have the option of asking for corresponding rainfall information. In such case, the system should also output the corresponding rainfall for the day for each reading. Notice that if the location does not have rainfall information, the system should find the closest location that have rainfall information.

Notice that distance between two points with (latitude, longitude) of (lat1, long1) and (lat2, long2) respectively can be calculated by the following equation (result unit is miles)

- Dist = sin(lat1) \* sin(lat2) + cos(lat1) \* cos(lat2) \* cos(long2 – long1) \* 6371.0

Notice that you need to be careful about the units. In the database latitude and longitude are stored as degrees. However, your programming language may require you to convert degrees to radians before using the sine and cosine functions.

Also notice that there may not be rainfall information at the current transducer. If there is the case, you should look for the rainfall information that is within 0.1 degree latitude and longitude of the location and locate the closest one (in such case you need to report the distance between the rainfall info and the well).  If none can be found, then report that no rainfall information is found.

- Location query: The user will enter a region by specifying the minimum and maximum latitude and longitude. The system will return all the wells and transducers within the region (it only needs to return IDs). The user can then select the corresponding id to show the corresponding information.

- Advanced/Transducer data analysis

Provide advanced transducer reading analysis by output the following

- Pearson&#39;s correlation coefficient between the various readings (tempature, pressure etc). Given two sequence X = (x1, x2, …, xn), and Y = (y1, y2, …, yn), the pearson coefficient is defined as

∑(xi−μx)(yi−μu)nσxσy

   Where μx σx are mean and standard deviation of (x1, x2, .. xn) (similar for y)

- If there is rainfall information associated with the transducer, for every day there is rainfall, list the reading data for that day. If multiple consecutive days have rainfall, they should be consolidated as one sequence.

You should also output the following

    - Changes in each of these values per hour
    - Correlation coefficient between the various values

- (Extra credit) Have the option to allow users to see all the sequence information in a graphical manner.
- (Extra credit) You can also propose other analysis on the transducer data. Two directions that we are going to:
    - Is there a way to detect &quot;sudden/abnormal&quot; events in the well
    - Can we characterize what happen to the readings when there is rain?
