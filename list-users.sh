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
API_URL = "https://api.github.com"

#Information need to export 
USERNAME = $username
TOKEN = $token

#Arguments
REPO_OWNER = $1
REPO_NAME = $2

function form_url{
url = "${API_URL}${REPO_OWNER}/${REPO_NAME}/collaborators"
curl -s -u "${USERNAME}${TOKEN}${API_URL}${url}"

}

   

