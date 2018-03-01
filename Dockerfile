FROM tensorflow/tensorflow:latest-gpu

RUN apt-get update && apt-get install -y --no-install-recommends \
	git-core wget protobuf-compiler less vim python-tk && \
	rm -rf /var/lib/apt/lists/*
RUN pip install pillow lxml jupyter matplotlib

WORKDIR /home/object_detection_api

RUN git clone https://github.com/tensorflow/models.git && \
    cd /home/object_detection_api/models && \
    #git checkout 64f0761ba3d56d196e1d7cb1a04a4d6fe3a761c1

    #commit that fixes inconsistency of label numbers
    git checkout d2de2d61958bc7684d566316b526d4ba2e4690f1

#RUN cd /home/object_detection_api/models/research \
#	&& protoc object_detection/protos/*.proto --python_out=.

RUN cd /home/object_detection_api/models\
        && protoc object_detection/protos/*.proto --python_out=.

#ADD models-master.zip /home/object_detection_api/
#
#RUN unzip models-master.zip && cd /home/object_detection_api/models-master \
#        && protoc object_detection/protos/*.proto --python_out=.

COPY entrypoint.sh /entrypoint.sh
RUN chmod 775 /entrypoint.sh

RUN mkdir /home/data

ENTRYPOINT ["/entrypoint.sh"]

