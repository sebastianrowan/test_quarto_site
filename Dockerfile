FROM eddelbuettel/r2u:20.04

RUN apt-get -y update 

RUN apt-get -y install --no-install-recommends \
    python3-pip \
    git \
    pandoc \
    pandoc-citeproc \
    curl \
    gdebi-core \
    && rm -rf /var/lib/apt/lists/*

RUN install.r \
    shiny \
    jsonlite \
    ggplot2 \
    htmltools \
    remotes \
    renv \
    knitr \
    rmarkdown \
    quarto


COPY requirements.txt requirements.txt

RUN pip3 install -r requirements.txt

RUN curl -LO https://quarto.org/download/latest/quarto-linux-amd64.deb
RUN gdebi --non-interactive quarto-linux-amd64.deb

CMD ["bash"]