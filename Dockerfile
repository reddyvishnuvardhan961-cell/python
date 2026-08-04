FROM python:3.12 AS build
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .

FROM python:3.12-slim
WORKDIR /app
COPY --from=build /app /app
EXPOSE 5000
CMD ["gunicorn","-w","4","-b","0.0.0.0:5000","app:app"]
