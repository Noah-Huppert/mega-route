# Brainstorming
Interface: API and web page

Input: Names of destinations

Output: Optimal route

Systems:

- Web frontend: User defines routes and views results
- Route definition api: Stores user's route requests
  - Data model:
	- This data is important to maintain
	- User: User account in site
	  - ID
	  - Name
	  - Email
	  - Email verified
	  - Email verification code hash
	  - Password hash
	- Route: Route definition
	  - ID
	  - Name
	  - User id
	- Route Stop: Stop on route
	  - ID
	  - Route id
	  - Name
	  - Reverse query
	  - Location: OSM node id, NULL when reverse query hasn't been run
- Route resolver: Reads route definitions and performs work to find the 
  best route
  - Runs reverse queries on all Route stops
  - Loads roads from Open Street Maps into Postgres for routing
  - Computes route with pgRouting
  - Data model:
	- This data can be lost if necessary, it can be rebuilt
	- Route Solution
	  - 
- Postgres + PostGIS + pgRouting

Models:
