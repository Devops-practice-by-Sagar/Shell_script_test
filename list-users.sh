#!/bin/bash

###################################
# Author: Sagar Sawant
# Script is used to fetch users
# details
# Date:08-02-2025
###################################

#curl -L \
#  -H "Accept: application/vnd.github+json" \
#  -H "Authorization: Bearer <YOUR-TOKEN>" \
#  -H "X-GitHub-Api-Version: 2022-11-28" \
#  https://api.github.com/repos/OWNER/REPO/pulls

#API URL
API_URL="https://api.github.com/repos"

#Information need to export
USERNAME=$username
TOKEN=$token

#Arguments
REPO_OWNER=$1
REPO_NAME=$2

#Function to request to Github API
function github_api_get{
        local endpoint='$3'
        local url="${API_URL}/${endpoint}"

        #Send Get Request to Git hub API
        curl -s -u "${USERNAME}:${TOKEN}" "$url"

}


function list_users_with_read_access{
        local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/collaborators"

        collaborators="$(github_api_get "$endpoint" | jq -r '.[] | select(.permissions.pull == true) | .login')"

        #Display list
        if[[-z "$colaborators"]]:then
                echo "No users with read access for ${REPO_OWNER}/${REPO_nsme}."
        else
                echo "Users with read access"
                echo "$collaborators"
        fi
}


#call function
list_users_with_read_access()
