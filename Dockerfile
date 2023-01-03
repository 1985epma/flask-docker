FROM python:3.8-slim-buster

USER  me

WORKDIR /python-docker

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]

HEALTHCHECK CMD curl --fail http://localhost:5000 || exit 1
