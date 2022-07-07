#!/bin/bash
mkdir -p ~/Workspace/{frbl,compsy,roqua,general,researchable}
cd ~/Workspace

github_clone() {
  pre=`pwd`
  org=$1
  repo=$2
  mkdir -p $org
  cd $org
  if [ ! -d "$2" ]
  then
    git clone git@github.com:$org/$repo.git
  fi
  cd $pre
}

github_http_clone() {
  pre=`pwd`
  org=$1
  repo=$2
  mkdir -p general
  cd general
  if [ ! -d "$2" ]
  then
    git clone https://github.com/$org/$repo.git
  fi
  cd $pre
}

gitlab_clone() {
  pre=`pwd`
  org=$1
  repo=$2
  mkdir -p $org
  cd $org
  if [ ! -d "$2" ]
  then
    git clone git@gitlab.com:$org/$repo.git
  fi
  cd $pre
}

syntho_clone() {
  pre=`pwd`
  org=$1
  repo=$2
  mkdir -p $org
  cd $org
  if [ ! -d "$2" ]
  then
    git clone git@ssh.dev.azure.com:v3/$org/$repo
  fi
  cd $pre
}

roqua_clone() {
  pre=`pwd`
  org=$1
  repo=$2
  folder=$3
  mkdir -p $folder
  cd $folder
  if [ ! -d "$2" ]
  then
    git clone git@gitlab.roqua.nl:$org/$repo.git
  fi
  cd $pre
}

tudelft_clone() {
  pre=`pwd`
  org=$1
  repo=$2
  folder=$3
  mkdir -p $folder
  cd $folder
  if [ ! -d "$2" ]
  then
    git clone git@gitlab.tudelft.nl:$org/$repo.git
  fi
  cd $pre
}



github_clone "apache" "superset"

github_clone "frbl" "notes"
github_clone "frbl" "frbl.github.io-private"
github_clone "frbl" "dotfiles-private"
github_clone "frbl" "dotfiles"
github_clone "frbl" "nixfiles"
github_clone "frbl" "machine-learning-recurring-depression"
github_clone "frbl" "onlinesuperlearner"
github_clone "frbl" "vagrant-boxes"
github_clone "frbl" "tmle-substitutes"

github_clone "frbl" "tmle-time-series"
github_clone "frbl" "research-slaapproblemen-en-agitatie"
github_clone "frbl" "vars"
github_clone "frbl" "airaR"
github_clone "frbl" "thesis"
github_clone "frbl" "ecida-dev"
github_clone "frbl" "ecida-gis"
github_clone "frbl" "thesis"
github_clone "frbl" "WacChat"
github_clone "frbl" "ansible"

github_clone "compsy" "vsv"
github_clone "compsy" "paper-u-can-act-baseline"
github_clone "compsy" "vsv_api_js"
github_clone "compsy" "hoe_gek_is"
github_clone "compsy" "personalized-coaching-app"
github_clone "compsy" "backup-container"
github_clone "compsy" "dev-infrastructure"
github_clone "compsy" "evaluatieonderzoek"
github_clone "compsy" "handboek-u-can-act"
github_clone "compsy" "yourspecialforces-public"

github_clone "rug-wacc" "teachers-2018"
github_clone "rug-sc" "teachers"

github_clone "rug-ds-lab" "planning-dynamic-spark"
github_clone "rug-ds-lab" "ecida-main"
github_clone "rug-ds-lab" "ecida"
github_clone "rug-ds-lab" "2018_Pratama_Low-intrusive-Power-Consumption-based-Occupancy-Detection-in-Office-Environment"
github_clone "rug-ds-lab" "2021-msc-ecida-open-source"

github_clone "kasperdokter" "dsu"
github_clone "mhadadian" "ecida-mvp"

gitlab_clone "ecida/examples" "house-prediction"
github_clone "ecida" "ecida.admin"
github_clone "ecida" "ecida.admin.server"

gitlab_clone "researchable" "quest-front-end"
gitlab_clone "researchable/general/landingpages" "landingpage-v2"
gitlab_clone "researchable/general/landingpages" "landingpage"
gitlab_clone "researchable/general/landingpages" "abl"
gitlab_clone "researchable/general/style" "eslint"
gitlab_clone "researchable/general/style" "rubocop"
gitlab_clone "researchable" "presentations"
gitlab_clone "researchable" "renovate"

gitlab_clone "researchable/general" "development-infrastructure"
gitlab_clone "researchable/general" "researchable-infrastructure"
gitlab_clone "researchable/general" "slack-bot"
gitlab_clone "researchable/general" "gitlab-bot"
gitlab_clone "researchable/general" "researchable-cli"

gitlab_clone "researchable/general/docker-images" "curl"
gitlab_clone "researchable/general/docker-images" "kubectl"
gitlab_clone "researchable/general/docker-images" "docker"
gitlab_clone "researchable/general/docker-images" "pandoc"
gitlab_clone "researchable/general/docker-images" "mongosh"

gitlab_clone "researchable/general/infrastructure" "kubernetes-restart-deployments"

gitlab_clone "researchable/general/gitlab" "runner-infrastructure"

gitlab_clone "researchable/general/templates/projects" "docs-template"
gitlab_clone "researchable/general/templates/projects" "react-tailwind-nextjs-typescript"

gitlab_clone "researchable/general/templates/gitlab" "semantic-release"
gitlab_clone "researchable/general/templates/gitlab" "swagger"
gitlab_clone "researchable/general/templates/gitlab" "kubernetes-post-deploy"
gitlab_clone "researchable/general/templates/gitlab" "heroku-post-deploy"
gitlab_clone "researchable/general/templates/gitlab" "docker-deploy"
gitlab_clone "researchable/general/templates/gitlab" "base"
gitlab_clone "researchable/general/templates/gitlab" "documentation"
gitlab_clone "researchable/general/templates/gitlab" "upstream-mirror"
gitlab_clone "researchable/general/templates/gitlab" "dependency-scanning-test"
gitlab_clone "researchable/general/templates/gitlab" "es-check-test"
gitlab_clone "researchable/general/templates/gitlab" "freedcamp-pre-test"
gitlab_clone "researchable/general/templates/gitlab" "freedcamp-post-deploy"

gitlab_clone "researchable/general/security" "vulnerability-scanning"
gitlab_clone "researchable/general/security" "kubernetes-rbac"
gitlab_clone "researchable/general/security" "gitlab-ssh-key-validations"
gitlab_clone "researchable/general/security" "pipeline_checker"
gitlab_clone "researchable/general/security" "certificate_checker"
gitlab_clone "researchable/general/security" "certificate_quality_checker"
gitlab_clone "researchable/general/security" "pipeline_checker"
gitlab_clone "researchable/general/security" "dmarc_checker"
gitlab_clone "researchable/general/security" "postgres_backup_checker"
gitlab_clone "researchable/general/security" "mongodb_backup_checker"
gitlab_clone "researchable/general/security" "general-fix-scripts"
gitlab_clone "researchable/general/security" "chaos_monkey"

gitlab_clone "researchable/projects/certibot" "docs"
gitlab_clone "researchable/projects/certibot" "base-backend"

gitlab_clone "researchable/general/management" "freedcamp-hour-counter"
gitlab_clone "researchable/general/management" "freedcamp-hour-importer"
gitlab_clone "researchable/general/management" "bookkeeper"
gitlab_clone "researchable/general/management" "freedcamp"
gitlab_clone "researchable/general/management" "gitlab-webhooks"

gitlab_clone "researchable/general/test-projects" "pay-nl-test"
gitlab_clone "researchable/general/test-projects" "messagequeue-test"
gitlab_clone "researchable/general/test-projects" "openwhisk-test"
gitlab_clone "researchable/general/test-projects" "aws-lambda-ruby-test"
gitlab_clone "researchable/general/test-projects" "twitter-api-test"
gitlab_clone "researchable/general/test-projects" "cypress-test"
gitlab_clone "researchable/general/test-projects" "polar-api-test"


gitlab_clone "researchable/ieder-kind-is-anders" "ikia-front-end"
gitlab_clone "researchable/ieder-kind-is-anders" "ikia-front-end-application"

# SDV
gitlab_clone "researchable/sport-data-valley/sdv" "presentation-sdv-pitch"
gitlab_clone "researchable/sport-data-valley/sdv" "sdv-infrastructure"
gitlab_clone "researchable/sport-data-valley/sdv" "sdv-poc"
gitlab_clone "researchable/sport-data-valley/sdv" "volleybal-dashboard"
gitlab_clone "researchable/sport-data-valley/sdv" "svc-loader-volleybal"
gitlab_clone "researchable/sport-data-valley/sdv" "svc-data-quality-checker"
gitlab_clone "researchable/sport-data-valley/sdv" "feature-test"

gitlab_clone "researchable/sport-data-valley/MVP" "base-platform"
gitlab_clone "researchable/sport-data-valley/MVP" "base-frontend"
gitlab_clone "researchable/sport-data-valley/MVP" "svc-wielerfitheid"
gitlab_clone "researchable/sport-data-valley/MVP" "infrastructure"
gitlab_clone "researchable/sport-data-valley/MVP" "integration-tests"
gitlab_clone "researchable/sport-data-valley/MVP" "svc-data-integrations"
gitlab_clone "researchable/sport-data-valley/MVP" "svc-questionnaires"
gitlab_clone "researchable/sport-data-valley/MVP" "jupyterhub"
gitlab_clone "researchable/sport-data-valley/MVP" "svc-backups"
gitlab_clone "researchable/sport-data-valley/MVP" "svc-data-mining-analysis-fitbit"
gitlab_clone "researchable/sport-data-valley/MVP" "test-deployment"
gitlab_clone "researchable/sport-data-valley/MVP" "loadtest"
gitlab_clone "researchable/sport-data-valley/MVP" "kube-backups"
gitlab_clone "researchable/sport-data-valley/MVP" "kube-access"

#gitlab_clone "sport-data-valley" "poc-data"
gitlab_clone "sportdatavalley" "data-mining-analysis-fitbit"

gitlab_clone "researchable/ieder-kind-is-anders" "ikia-front-end-application"

# i-shared
gitlab_clone "researchable/projects/i-shared" "svc-visualization-js"
gitlab_clone "researchable/projects/i-shared" "infrastructure"
gitlab_clone "researchable/projects/i-shared" "svc-pdfgenerator"
gitlab_clone "researchable/projects/i-shared" "svc-prediction-r"
#gitlab_clone "researchable/samen-sturen" "svc-prediction"
gitlab_clone "researchable/projects/i-shared" "composer"
gitlab_clone "researchable/projects/i-shared" "docs"

gitlab_clone "researchable/open-source/forks" "materialize"
gitlab_clone "researchable/open-source/forks" "react-add-to-homescreen"

gitlab_clone "researchable/open-source/openapi" "serverless-lambda-ruby"
gitlab_clone "researchable/open-source/openapi" "serverless-lambda-node"

gitlab_clone "researchable/open-source/api-gems" "polar-accesslink-api-gem"
gitlab_clone "researchable/open-source/api-gems" "freedcamp-api-gem"
gitlab_clone "researchable/open-source" "quest-management-interface"

# UMO
gitlab_clone "researchable/projects/umo" "docs"
gitlab_clone "researchable/projects/umo" "infrastructure"
gitlab_clone "researchable/projects/umo" "composer"
gitlab_clone "researchable/projects/umo" "base-frontend"
gitlab_clone "researchable/projects/umo" "base-backend"

# Delta Dashboard
gitlab_clone "researchable/projects/delta-dashboard" "base-frontend"
gitlab_clone "researchable/projects/delta-dashboard" "docs"

gitlab_clone "researchable/projects/ucl-recessly" "docs"
gitlab_clone "researchable/projects/ucl-recessly" "base-frontend"
gitlab_clone "researchable/projects/ucl-recessly" "base-backend"

gitlab_clone "researchable/projects/ev-biotech" "poc"
gitlab_clone "researchable/projects/ev-biotech" "docs"
gitlab_clone "researchable/projects/ev-biotech" "base-backend"
gitlab_clone "researchable/projects/ev-biotech" "base-frontend"
gitlab_clone "researchable/projects/ev-biotech" "data-access"
gitlab_clone "researchable/projects/ev-biotech" "neo4j-poller"
gitlab_clone "researchable/projects/ev-biotech" "infrastructure"
gitlab_clone "researchable/projects/ev-biotech" "composer"

# Aukati
gitlab_clone "researchable/aukati" "svc-auth"
gitlab_clone "researchable/aukati" "svc-groups"
gitlab_clone "researchable/aukati" "svc-kaikohi"
gitlab_clone "researchable/aukati" "svclss-mailer"
gitlab_clone "researchable/aukati" "docs"
gitlab_clone "researchable/aukati" "svc-docx"
gitlab_clone "researchable/aukati" "svclss-mailer"
gitlab_clone "researchable/aukati" "svc-payments"
gitlab_clone "researchable/aukati" "gem-researchable"

roqua_clone "ishared" "prediction-model-r" "researchable/samen-sturen"
roqua_clone "ishared" "clustering-model-r-raw" "researchable/samen-sturen"
roqua_clone "ishared" "prediction-model-r-raw" "researchable/samen-sturen"
roqua_clone "ishared" "svc-prediction-r" "researchable/samen-sturen"
roqua_clone "ishared" "svc-visualization-r" "researchable/samen-sturen"
roqua_clone "ishared" "svc-visualization-js" "researchable/samen-sturen"

roqua_clone "roqua" "deployer" "roqua"
roqua_clone "roqua" "roqua" "roqua"
roqua_clone "roqua" "compose" "roqua"
roqua_clone "roqua" "core" "roqua"
roqua_clone "roqua" "questionnaires" "roqua" 

tudelft_clone "umo-development" "umo-ckan" "umo-development"
tudelft_clone "umo-development" "ckanuploadclient-java" "umo-development"
tudelft_clone "umo-development" "ckanuploadclient" "umo-development"
tudelft_clone "umo-development" "umo-ckan-docker" "umo-development"
tudelft_clone "umo-development/umo-deployment" "umo-nomad-deployment" "umo-development/umo-deployment"

#gitlab_clone "roqua" "autovar"

# Vitens
#gitlab_clone "vitens/Nachtwacht/" "nachtwacht-core"
gitlab_clone "vitens/ecida" "ecida-poc"
gitlab_clone "vitens/ecida" "ecida-notebook-extension"
gitlab_clone "vitens/ecida" "ecida-docker-container-builder-service"
gitlab_clone "vitens/ecida" "abstract-operator"
gitlab_clone "vitens/ecida" "utilities"
gitlab_clone "vitens/ecida/templates" "base"

syntho_clone "syntho/Syntho%20Engine%20Application" "syntho-engine-backend"
syntho_clone "syntho/Syntho%20Engine%20Application" "syntho-engine-UI"

github_http_clone "jvm-operators" "abstract-operator"
github_clone "to314as" "HeartRateModel_WielerFitheid"
#ln -s /home/frbl/Workspace/to314as/HeartRateModel_WielerFitheid/ /home/frbl/Workspace/researchable/sport-data-valley/MVP/svc-wielerfitheid

github_clone "ecida" "docs"
github_clone "ecida" "ecida-dashboard"

