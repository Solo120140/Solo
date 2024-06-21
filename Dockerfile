# Use the base image for Jupyter notebooks
FROM jupyter/base-notebook:latest

# Switch to root user to install Node.js
USER root

# Install Node.js 20
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Switch back to the notebook user
USER ${NB_UID}

# Create a directory for notebooks (optional, usually done in binder configuration)
RUN mkdir -p /home/jovyan/work

# Set the working directory
WORKDIR /home/jovyan/work

# Copy any local content to the working directory (optional)
# COPY . /home/jovyan/work

# Expose port for Jupyter
EXPOSE 8888

# Start Jupyter Notebook
CMD ["start-notebook.sh"]

