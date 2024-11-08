# Use an official Python image as base
FROM ubuntu:latest

RUN apt update -y

RUN apt install python3 pip python3-pip -y

RUN pip --version

RUN python3 --version

RUN ls -al /home/ubuntu/test_app


# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

RUN pip install gunicorn

# # Copy application code
# COPY . .

# # Expose port
# EXPOSE 5000

# # Run command when container launches
# CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]