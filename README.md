## GIS4DIS REST API endpoints
List of API endpoints (https://zelda.sci.muni.cz/rest/api/)

#### /config
Configuration of the app. Information about phenomenons, parameters and dictionaries. Based on this configuration the app GUI will be created.

#### /photos
All photos gathered with observations

#### /localization
Language localizations of the app

#### /observations
Observations from the users

###### Filtering
* By point and radius
  * parameters
    * **point** in format `longitude,latitude`
    * **radius** in meters
  * E.g.
    `/observations/?point=15.2773065,49.0804684&radius=100`
* By bbox
  * parameters
    * **bbox** in format `xmin,ymin,xmax,ymax`
  * E.g.
    `/observations/?bbox=15.2773065,49.0804684,15.4773065,49.1804684`

### Pagination
Pagination by page number and page size
* parameters
  * **page** - number of page
  * **page_size** - number of elements
* E.g. `/observations/?page=1` or `/observations/?page=1&page_size=10`
