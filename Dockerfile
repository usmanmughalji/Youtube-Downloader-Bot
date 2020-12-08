FROM ubuntu:20.04

RUN apt-get -qq update && \
    apt-get -qq install -y ffmpeg locales


COPY requirements.txt .

RUN pip3 install --no-cache-dir -r requirements.txt && \
    apt-get -qq purge git
    
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
COPY . .
RUN chmod +x start.sh

CMD ["bash","start.sh"]
