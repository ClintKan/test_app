# Use an official Python image as base
FROM python:3.11

#Declare and create the working directory in the container
WORKDIR /test_app

# Copying the files from the clone repo (in the EC2) to the container
COPY . .

# Verification that we are in the right folder
RUN ls -al

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

RUN pip install gunicorn

# Expose port of the EC2 not container
EXPOSE 80

# Run command when container launches
CMD ["python3", "-m", "gunicorn", "4", "application:app", "-b", "0.0.0.0"]
