/* 
Average home price: The mean expenditure associated with residential properties within each respective locality.

Average bed/bath: The mean quantity of bedrooms and bathrooms within each distinct locality, as well as the aggregate for the entire city.

Types of Properties: The enumeration of properties categorized as houses, condos, townhouses, co-operatives, multi-family, etc... homes within each distinct
locality, as well as the aggregate for the entire city.
 
Amount of Properties - the sublocality exhibiting the highest inventory of available properties within the dataset.
*/

SELECT * 
FROM nyc_housing;

# ----------------------------------------------------------------------------------------------------------------------------

# Average home price: The mean expenditure associated with residential properties within each respective sublocality.
SELECT sublocality AS Neighborhood,
	   CEIL(AVG(price)) AS Average_Price
FROM nyc_housing
GROUP BY Neighborhood;

# ----------------------------------------------------------------------------------------------------------------------------

# Average bed/bath: The mean quantity of bedrooms and bathrooms within each distinct locality, as well as the aggregate for the entire city.
SELECT CEIL(AVG(beds)) AS Average_Beds,
	   CEIL(AVG(bath)) AS Average_Baths
FROM nyc_housing;

	# The Entire City
SELECT sublocality AS Neighborhood,
	   CEIL(AVG(beds)) AS Average_Beds,
	   CEIL(AVG(bath)) AS Average_Baths
FROM nyc_housing
GROUP BY Neighborhood;

# ----------------------------------------------------------------------------------------------------------------------------

# Types of Properties: The enumeration of properties categorized as houses, condos, townhouses, co-operatives, multi-family, etc... homes within each distinct 
# locality, as well as the aggregate for the entire city.
SELECT sublocality AS Neighborhood,
	   type AS Type_Of_Home,
       Count(*) AS Amount_Of_Homes
FROM nyc_housing
GROUP BY Neighborhood,
	     Type_Of_Home
ORDER BY Neighborhood ASC;

	# The Entire City
SELECT type AS Type_Of_Home,
       Count(*) AS Amount_Of_Homes
FROM nyc_housing
GROUP BY Type_Of_Home;

# ----------------------------------------------------------------------------------------------------------------------------

# Amount of Properties - the sublocality exhibiting the highest inventory of available properties within the dataset.
SELECT sublocality AS Neighborhood,
COUNT(TYPE) AS Amount_Of_Homes
FROM nyc_housing
GROUP BY Neighborhood
ORDER BY Amount_Of_Homes DESC
LIMIT 1;





