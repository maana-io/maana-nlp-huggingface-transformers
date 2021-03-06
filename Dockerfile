FROM tiangolo/uvicorn-gunicorn:python3.7

RUN pip install ariadne uvicorn gunicorn asgi-lifespan python-dotenv requests graphqlclient
RUN pip install tensorflow torch torchvision transformers
RUN pip install tensorboardX tensorboard scikit-learn seqeval pandas numpy

COPY ./app /app
COPY .env /.env
COPY ./gunicorn_conf.py /
COPY start.sh /start.sh
RUN chmod +x /start.sh

WORKDIR /
EXPOSE 8050
CMD /start.sh
