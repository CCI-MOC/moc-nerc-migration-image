Scripts to build the moc-nerg-migration image for OpenStack volume migrations.

To build the image:

1. Download a recent CentOS 8 Stream base image.
2. Set `MIGRATE_BASE_IMAGE` to the full path to that image.
3. Run `build-image.sh`.

This will produce a file `moc-nerc-migration.qcow2` in your current directory.
