#!/bin/bash

echo ============================================================================
echo Deploying fabric8 website
echo ============================================================================

cd website && \
npm install -g gitbook-cli && \
npm install && \
mvn clean && \
mkdir -p target && \
cd target && \
git clone -b gh-pages git@github.com:fabric8io/fabric8.git sitegen && \
cd .. && \
mvn scalate:sitegen && \
mkdir -p target/sitegen/guide && \
gitbook install ../docs  && \
gitbook build ../docs && \
cp -r ../docs/_book/* target/sitegen/guide && \
cd target/sitegen && \
git add * guide/* && \
git commit -m "generated website" && \
git push

#gitbook install ../docs --output=target/sitegen/guide && \


echo ============================================================================
echo Deployed fabric8 website
echo ============================================================================

