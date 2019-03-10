## GIS4DIS REST API endpoints
List of API endpoints (https://zelda.sci.muni.cz/rest/api/)

#### /config
Configuration of the app. Information about phenomenons, parameters and dictionaries. Based on this configuration the app GUI will be created.

###### Filtering
* By category
  * parameters
    * **category**
  * E.g.
    `/config/?category=drought`

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
* By date
  * parameters
    * **from** in format `YYYY-MM-DD`
    * **to** in format `YYYY-MM-DD`
  * E.g.
    `observations/?from=2018-05-22&to=2018-05-23`
* By phenomenon name
  * parameters
    * **phenomenon**
  * E.g.
    `observations/?phenomenon=Dry vegetation (trees)`
* By phenomenon id
  * parameters
    * **phenomenon_id**
  * E.g.
    `observations/?phenomenon_id=1`
* By category name
  * parameters
    * **category**
  * E.g.
    `observations/?category=Drought`
* By category id
  * parameters
    * **category_id**
  * E.g.
    `observations/?category_id=1`

### Pagination
Pagination by page number and page size
* parameters
  * **page** - number of page
  * **page_size** - number of elements
* E.g. `/observations/?page=1` or `/observations/?page=1&page_size=10`

### Phenomenons for parsing 
From config endpoint: [https://zelda.sci.muni.cz/rest/api/config/?category=drought](https://zelda.sci.muni.cz/rest/api/config/?category=drought)
* Dry vegetation (trees)
* Absence of mushrooms

## Docker
You can run docker image of [gis4dis-backend](https://cloud.docker.com/repository/docker/bulva/gis4dis-backend) inside the container with nginx, gunicorn and PostgreSQL database.

You have to add ssl certificate to `./config/nginx/yourdomain.pem` and `./config/nginx/yourdomain.key`. Then you have to rename volumes of nginx service in docker-compose.yml.

Uncomment ssl and listen 443 in `nginx/conf.d/local.conf` file. You can change settings of nginx if you want.

Then you can build and start the app:
```bash
docker-compose build
docker-compose up
```

After that in other connection (terminal) run this:
```bash
docker exec -it gis4dis-docker-backend_database_1 bash
psql -h localhost -p 5432 -U rest rest < rest_11-02-2019.sql
```

This will import the dump of the PostgreSQL database. You can check the container is running on `localhost:8000/rest/api/config`. In `docker-compose.yml` you can change port (80 instead of 8000)



