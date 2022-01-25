# fly.io free postgres db 

https://news.ycombinator.com/item?id=30018197
	
	❯ flyctl postgres create
	? App Name: mydb
	Automatically selected personal organization: Aaron Kelly
	? Select region: ams (Amsterdam, Netherlands)
	? Select configuration: Specify custom configuration
	? Select configuration: Development (Single node)
	? Select VM size:  [Use arrows to move, type to filter]
	> shared-cpu-1x - 256
	  dedicated-cpu-1x - 2048
	  dedicated-cpu-2x - 4096
	  dedicated-cpu-4x - 8192
	  dedicated-cpu-8x - 16384
	❯ flyctl postgres create
	? App Name: mydb
	Automatically selected personal organization: Aaron Kelly
	? Select region: ams (Amsterdam, Netherlands)
	? Select configuration: Development - Single node, 1x shared CPU, 256MB RAM, 10GB disk
	Creating postgres cluster mydb in organization personal
	Postgres cluster mydb created
	  Username:    postgres
	  Password:    XXXX
	  Hostname:    mydb.internal
	  Proxy Port:  5432
	  PG Port: 5433
	Save your credentials in a secure place, you won't be able to see them again!
	
	Monitoring Deployment
	
	1 desired, 1 placed, 1 healthy, 0 unhealthy [health checks: 2 total, 2 passing]
	--> v0 deployed successfully
	
	Connect to postgres
	Any app within the personal organization can connect to postgres using the above credentials and the hostname "mydb.internal."
	For example: postgres://postgres:9358903f6cef17f97838ad6fa3a3d1da5b7d5fe3d973325e@mydb.internal:5432
	
	See the postgres docs for more information on next steps, managing postgres, connecting from outside fly:  https://fly.io/docs/reference/postgres/