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



# # Expose port
# EXPOSE 5000

# # Run command when container launches
# CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]

# RUN apt install python3 pip python3-pip -y

# RUN pip --version

# RUN python3 --version