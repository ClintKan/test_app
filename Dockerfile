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
CMD ["python3", "-m", "gunicorn", "-w", "4", "application:app", "-b", "0.0.0.0"]

# To create the image - first
# docker build -t urlshort_img .

# Then to create the container that would have the app
# docker run -d -ti -p 80:8000 --name Ibra_site urlshort_img