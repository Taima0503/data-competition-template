MLFLOW_PORT := 5000
MLFLOW_NUM_GUNICORN_WORKER := 1


# http://postd.cc/auto-documented-makefile/
.DEFAULT_GOAL := help
help: FORCE ## Show this help
	@grep -E '^[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	    | awk 'BEGIN {FS = ":.*?## "}; {printf "%-30s %s\n", $$1, $$2}'


view: FORCE  ## viewing the Tracking UI of MLflow
	poetry run mlflow ui -p ${MLFLOW_PORT} -w ${MLFLOW_NUM_GUNICORN_WORKER}


FORCE:
