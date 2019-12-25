CREATE TABLE User (
	  id SERIAL PRIMARY KEY,
	  name TEXT NOT NULL,
	  email TEXT NOT NULL,
	  email_verify_hash TEXT NOT NULL,
	  email_valid BOOLEAN NOT NULL,
	  password_hash TEXT NOT NULL
);

CREATE TABLE Route (
	  id SERIAL PRIMARY KEY,
	  user_id INTEGER REFERENCES User,
	  name TEXT NOT NULL
);

CREATE TABLE RouteStop (
	  id SERIAL PRIMARY KEY,
	  route_id INTEGER REFERENCES Route,
	  name TEXT NOT NULL,
	  way_id INTEGER NOT NULL
);
