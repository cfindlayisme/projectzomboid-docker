#!/bin/bash
#
# Start script handler for GCP projectzomboid-docker image
#
# Author: Chuck Findlay <chuck@findlayis.me>
# License: LGPL v3.0

echo "0 */1 * * * gcloud auth activate-service-account --key-file=/gcs-key.json && gsutil -m cp -r /root/Zomboid gs://$GCS_BUCKET$GCS_BUCKET_PATH/" > /etc/cron.d/gcs-hourly-backup
chmod 0644 /etc/cron.d/gcs-hourly-backup
crontab /etc/cron.d/gcs-hourly-backup

# Start cron so it runs auto backups
cron

# Authenticate to GCS
gcloud auth activate-service-account --key-file=/gcs-key.json

# Copy files from GCS to /root (so /root/Zomboid is there)
gsutil -m cp -r gs://$GCS_BUCKET$GCS_BUCKET_PATH/Zomboid /root/

/run.sh

# Copy files again once the server is done
gsutil -m cp -r /root/Zomboid gs://$GCS_BUCKET$GCS_BUCKET_PATH/