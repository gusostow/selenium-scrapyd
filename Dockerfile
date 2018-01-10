FROM markadams/chromium-xvfb-py3:latest

RUN pip3 install --upgrade setuptools pip

RUN pip3 install psycopg2 \ 
                 sqlalchemy \ 
                 bs4 \ 
                 selenium \ 
                 scrapy \ 
                 scrapyd \
                 scrapyd-client \
                 spiderkeeper

RUN mkdir /work

ADD entrypoint.sh /etc

WORKDIR /work

EXPOSE 6800 5000

ENTRYPOINT ["/etc/entrypoint.sh"]