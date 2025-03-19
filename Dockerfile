# Step 1: Use the official Python base image
FROM python:3.9-alpine

# Step 2: Set the working directory inside the container
WORKDIR /app

RUN pip install --upgrade pip

# Step 3: Copy the requirements file into the container
COPY requirements.txt .

# Step 4: Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Step 5: Copy the application code into the container
COPY . .

# Step 6: Expose port 5000 for the Flask app
EXPOSE 5000

# Step 7: Set the entry point to run the app (assuming '__init__.py' initializes the app)
CMD ["flask", "run", "--host=0.0.0.0"]
