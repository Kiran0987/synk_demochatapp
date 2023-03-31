FROM python:3.10.10
RUN apt-get update
RUN apt-get install --yes python3-pip
RUN mkdir /new_chatapp
COPY /new_chatapp-1  /new_chatapp
WORKDIR /new_chatapp
RUN pip3 install -r requirements.txt
RUN pip3 install mysqlclient
EXPOSE 8000
WORKDIR /new_chatapp/fundoo/
ENTRYPOINT  python manage.py migrate && python3 manage.py runserver 0.0.0.0:8000
