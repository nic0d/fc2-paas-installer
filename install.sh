#!/bin/bash -ex

export NISE_DOMAIN=$1
export NISE_PASSWORD=$2

~/fc2-paas-installer/scripts/generate_admin_ui_conf.sh
~/fc2-paas-installer/scripts/generate_admin_ui_uaa_conf.sh

cp ~/fc2-paas-installer/generated/default.yml ~/admin-ui/config/

cd ~/cf_nise_installer
./scripts/install_cf_release.sh

set +x
echo "Installation done!"
echo "Starting FI-Content 2 PaaS..."

./scripts/start.sh

echo "############################################"
echo "######## FI-Content 2 PaaS started. ########"
echo "############################################"

echo "\nAdmin UI configuration..."
~/fc2-paas-installer/generated/admin_ui_uaa_config.sh

cd ~/admin-ui
bundle install
ruby bin/admin &

echo "############################################"
echo "########### Web console started ############"
echo "############################################"

echo "FI-Content 2 PaaS is started !"
echo "API endpoint: https://api."+$1
echo "Credential: admin/"+$2