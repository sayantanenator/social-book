# Dockerfile

FROM --platform=$BUILDPLATFORM python:3.7-alpine AS builder
EXPOSE 8000
WORKDIR /app 
COPY requirements.txt /app
RUN pip install -r requirements.txt --no-cache-dir
COPY . /app 
ENTRYPOINT ["python3"] 


# install Docker tools (cli, buildx, compose)
COPY --from=gloursdocker/docker / /
CMD ["manage.py", "runserver", "0.0.0.0:8000"]


