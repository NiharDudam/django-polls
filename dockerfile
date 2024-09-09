###
# For testing purposes #
###

# Use an official Python runtime as a parent image
FROM python:3.11-slim-buster

# Set working directory
ENV APP_HOME=/home/app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

# Set environment variables
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

# Copy the requirements file

# Install dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends gcc libpq-dev python-dev

RUN pip install --upgrade pip

COPY requirements.txt requirements.txt 
RUN pip install --no-cache-dir -r requirements.txt

# Copy the project code
COPY . .


# Expose the port that Django will run on
EXPOSE 8000

# Run the command to start the Django server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
