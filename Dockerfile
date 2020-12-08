FROM ubuntu:20.04

RUN apt-get -qq update && \
    apt-get -qq install -y ffmpeg


COPY requirements.txt .

RUN pip3 install --no-cache-dir -r requirements.txt && \
    apt-get -qq purge git
    
RUN chmod +x aria.sh

CMD ["bash","start.sh"]
