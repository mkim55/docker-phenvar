# Dockerfile for PhenVar

FROM ubuntu:latest

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
	gcc \
	git \
	python-pip

RUN git clone https://github.com/NCBI-Hackathons/PhenVar.git

WORKDIR PhenVar

# Install python dependencies
# RUN pip install --upgrade pip setuptools wheel
# RUN pip install --no-cache-dir biopython nltk Pillow matplotlib
# RUN apt-get install -y libfreetype6-dev

# RUN pip install conda
# RUN conda install -c conda-forge wordcloud
RUN pip install wordcloud

# Initialize and load database and json cache, may take ~ 1 day
CMD [ "python", "./manage.py initialize" ]
CMD ["python", "./manage.py load"]
CMD ["python", "./manage.py resume"]

CMD ["python", "./manage.py build_json"]
CMD ["python", "./manage.py update"]
