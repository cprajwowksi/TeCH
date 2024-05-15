FROM python
WORKDIR app
COPY ./app .
RUN pip install -r requirements.txt
EXPOSE 3003
CMD ["python3", "app.py"]
