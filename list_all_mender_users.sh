#! /bin/bash

MENDER_SERVER_URI='<menderserver>'
MENDER_SERVER_USER='<menderuser>'
MENDER_SERVER_PASSWORD='<menderpassword>'

JWT=$(curl -X POST -u $MENDER_SERVER_USER:$MENDER_SERVER_PASSWORD $MENDER_SERVER_URI/api/management/v1/useradm/auth/login -k)
echo -n "${JWT}" > .mender_jwt
API_KEY=$(cat .mender_jwt)

RESPONSE=$(curl --insecure -X GET $MENDER_SERVER_URI/api/management/v1/useradm/users -H 'Accept: application/json' -H "Authorization: Bearer $API_KEY")
echo ${RESPONSE}

