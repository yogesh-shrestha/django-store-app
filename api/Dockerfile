FROM python:3.11
ENV PYTHONUNBUFFERED 1
WORKDIR /app
RUN pip install --upgrade pip 
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
RUN pip install mysqlclient
COPY . /app/
EXPOSE 8000
CMD ["python," "manage.py", "migrate"]
