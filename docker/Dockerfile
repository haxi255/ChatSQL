FROM nvidia/cuda:11.7.1-runtime-ubuntu20.04

RUN apt-get clean
RUN apt-get update -y
RUN apt-get install -y python3 python3-pip

COPY ./requirements.txt /tmp/requirements.txt
RUN pip install -r requirements.txt --index-url https://mirrors.ustc.edu.cn/pypi/web/simple

WORKDIR /app
COPY . /app

# 新建文件夹
RUN mkdir DB
RUN mkdir logs

CMD ["python", "local_database.py"]
