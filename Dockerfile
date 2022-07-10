# start by pulling the python base image
FROM python:3.9

# copy the requirements file into the image
COPY ./requirements.txt /app/requirements.txt

# switch working directory
WORKDIR /app

# install the dependencies and packages in the requirements file
RUN pip install -r requirements.txt
RUN pip install torch==1.9.0 torchvision==0.10.0 torchaudio==0.10.0

# set environment variables for Flask debug development
ENV FLASK_APP=app.py
ENV FLASK_ENV=development
ENV FLASK_DEBUG=1

# copy every content from the local file to the image
COPY ./app /app

# execution command
CMD ["python", "app.py"]