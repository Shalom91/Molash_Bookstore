# pull base image
FROM python:3.9

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1


# set work directory
WORKDIR /code

# install dependencies
RUN pip install --upgrade pip
COPY Pipfile Pipfile.lock /code/
RUN pip install pipenv && pipenv install --system


# copy project
COPY . /code/
