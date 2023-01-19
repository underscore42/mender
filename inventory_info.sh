#! /bin/bash

# usage
# ./get_device_status.sh d9c5c6e5-e9fd-4f6e-80a3-5245af11ef3d
#

MENDER_SERVER_URI='<menderserver>'
MENDER_SERVER_USER='<menderuser>'
MENDER_SERVER_PASSWORD='<menderpassword>'

JWT=$(curl -X POST -u $MENDER_SERVER_USER:$MENDER_SERVER_PASSWORD $MENDER_SERVER_URI/api/management/v1/useradm/auth/login -k)
echo -n "${JWT}" > .mender_jwt
API_KEY=$(cat .mender_jwt)

RESPONSE=$(curl --insecure -X GET $MENDER_SERVER_URI/api/management/v2/devauth/devices/count -H 'Accept: application/json' -H "Authorization: Bearer $API_KEY")
echo ${RESPONSE}

RESPONSE=$(curl --insecure -X GET $MENDER_SERVER_URI/api/management/v2/devauth/limits/max_devices -H 'Accept: application/json' -H "Authorization: Bearer $API_KEY")
echo ${RESPONSE}


RESPONSE=$(curl --insecure -X GET $MENDER_SERVER_URI/api/management/v1/inventory/devices?per_page=100 -H 'Accept: application/json' -H "Authorization: Bearer $API_KEY")
echo ${RESPONSE} > inv.json
cat inv.json
