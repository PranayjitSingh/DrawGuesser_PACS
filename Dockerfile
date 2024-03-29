﻿# start by pulling the python base image
FROM python:3.9

# copy the requirements file into the image
COPY ./requirements.txt /draw_app/requirements.txt

# switch working directory
WORKDIR /draw_app

# install the dependencies and packages in the requirements file
RUN pip install -r requirements.txt

# set environment variables for Flask debug development
ENV FLASK_APP=app/app.py
ENV FLASK_ENV=development
ENV FLASK_DEBUG=1

# copy every content from the local file to the image
COPY ./app /draw_app/app

# execution command
CMD ["python", "app/app.py", "0.0.0.0", "5000"]