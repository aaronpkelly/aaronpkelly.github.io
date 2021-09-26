# clearing space

## delete unused snapshots

you have monthly, weekly and daily, and hourly snapshots

	zfs list -t snapshot

	zfs destroy <SNAPSHOT>
	
## or just configure the number of snapshots to keep

	zfs-auto-snapshot monthly 1
	zfs-auto-snapshot weekly 1
	zfs-auto-snapshot daily 1
	zfs-auto-snapshot hourly 1