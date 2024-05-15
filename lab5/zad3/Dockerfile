ARG PYTHON_VERSION

FROM python:${PYTHON_VERSION}
WORKDIR /opt
COPY ./myapp .
RUN pip install -r requirements.txt
CMD ["python3", "myapp.py"]
