# pull base image
FROM python:3.9

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1


# set work directory
WORKDIR /usr/src/molash_bookstore

# install dependencies
RUN pip install --upgrade pip
COPY Pipfile Pipfile.lock /code/
RUN pip install pipenv && pipenv install --system

# copy entrypoint.sh
COPY ./entrypoint.sh .

# copy project
COPY . /code/

# run entrypoint.sh
ENTRYPOINT ["/usr/src/molash_bookstore/entrypoint.sh"]
