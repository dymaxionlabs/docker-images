.EXPORT_ALL_VARIABLES:

IMAGE_NAME := jupyter-minimal-gpu
VERSION    := 0.1.0

include .env

build:
	gcloud builds submit --substitutions=_LOCATION=${LOCATION},_REPO_NAME=${REPO_NAME},_IMAGE_NAME=${IMAGE_NAME},_VERSION=${VERSION} --project=${PROJECT_ID}
