#!/bin/bash
#
# Start script handler for GCP projectzomboid-docker image
#
# Author: Chuck Findlay <chuck@findlayis.me>
# License: LGPL v3.0

echo "0 */1 * * * gcloud auth activate-service-account --key-file=/config/gcs-key.json && gsutil cp /config/world.zip gs://$GCS_BUCKET$GCS_BUCKET_PATH/world.zip" > /etc/cron.d/gcs-hourly-backup
chmod 0644 /etc/cron.d/gcs-hourly-backup
crontab /etc/cron.d/gcs-hourly-backup

# Start cron so it runs auto backups
cron

## do stuff

/run.sh