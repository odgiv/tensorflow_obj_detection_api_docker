FROM tensorflow/tensorflow:latest-gpu

RUN apt-get update && apt-get install -y --no-install-recommends \
	git-core wget protobuf-compiler less vim python-tk && \
	rm -rf /var/lib/apt/lists/*
RUN pip install pillow lxml jupyter matplotlib

WORKDIR /home/object_detection_api

RUN git clone https://github.com/tensorflow/models.git

RUN cd /home/object_detection_api/models/research \
	&& protoc object_detection/protos/*.proto --python_out=.

COPY entrypoint.sh /entrypoint.sh
RUN chmod 775 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

