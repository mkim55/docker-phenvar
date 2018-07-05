# Dockerfile for PhenVar

FROM ubuntu:latest

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
	gcc \
	git \
	python-pip

# Install python dependencies
RUN pip install --no-cache-dir biopython nltk Pillow matplotlib wordcloud
RUN git clone https://github.com/NCBI-Hackathons/PhenVar.git
