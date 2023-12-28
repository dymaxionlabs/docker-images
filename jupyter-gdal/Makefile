.EXPORT_ALL_VARIABLES:

IMAGE_NAME := jupyter-gdal
VERSION    := python-3.10.11-otb-8.1.1

include .env

build:
	gcloud builds submit --substitutions=_LOCATION=${LOCATION},_REPO_NAME=${REPO_NAME},_IMAGE_NAME=${IMAGE_NAME},_VERSION=${VERSION} --project=${PROJECT_ID}
