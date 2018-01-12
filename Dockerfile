FROM markadams/chromium-xvfb-py3:latest

RUN apt-get update & apt-get install -y psmisc cron

RUN pip3 install --upgrade setuptools pip

RUN pip3 install psycopg2 \ 
                 sqlalchemy \ 
                 bs4 \ 
                 selenium \ 
                 scrapy \ 
                 scrapyd \
                 scrapyd-client \
                 spiderkeeper

ADD killchromium /etc/cron.d/killchromium

RUN chmod 0644 /etc/cron.d/killchromium

RUN touch /var/log/cron.txt

RUN mkdir /work

ADD entrypoint.sh /etc

WORKDIR /work

EXPOSE 6800 5000

ENTRYPOINT ["/etc/entrypoint.sh"]