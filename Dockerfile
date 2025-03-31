FROM python:latest

RUN git clone -b update-urls https://github.com/lamentary/zap2it-GuideScraping.git /zap2it

ADD entry.sh /entry.sh
RUN chmod 755 /entry.sh /zap2it/zap2it-GuideScrape.py

CMD ["/entry.sh"]
