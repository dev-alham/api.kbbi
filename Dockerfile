FROM python:3.7
ADD . /app
WORKDIR /app
RUN apt-get update && \
    pip install --upgrade pip && \
    pip install -r requirements.txt
RUN chmod a+x /app
EXPOSE 4000
CMD ["gunicorn", "--workers=3", "--threads=3", "-b 0.0.0.0:4000","app_main:core"]