sheepdog-exporter --credentials /home/quokka/Downloads/credentials.json --output-path /home/quokka/Desktop
newt new /home/quokka/Desktop/topmed-public.json --output-json /home/quokka/Desktop/transformed-topmed-public.json
export GOOGLE_APPLICATION_CREDENTIALS=/home/quokka/git/backup_dss_credentials/new_service_account_platform_admin.json
dssload --no-dry-run --dss-endpoint https://commons-dss.ucsc-cgp-dev.org/v1 --staging-bucket commons-dss-upload /home/quokka/Desktop/transformed-topmed-public.json
