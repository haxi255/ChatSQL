FROM nvidia/cuda:11.7.1-runtime-ubuntu20.04

RUN apt-get clean
RUN apt-get update -y
RUN apt-get install -y python3 python3-pip git

COPY ./requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt --index-url https://mirrors.ustc.edu.cn/pypi/web/simple

WORKDIR /app
COPY . /app

RUN apt-get install -y curl
RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash
RUN apt-get install git-lfs
RUN git lfs install
RUN git clone https://huggingface.co/sentence-transformers/paraphrase-multilingual-MiniLM-L12-v2

# 新建文件夹
RUN mkdir /app/DB
RUN mkdir /app/logs

RUN python3 local_database.py
