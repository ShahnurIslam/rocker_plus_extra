FROM rocker/shiny-verse:3.6.3

RUN apt-get update && \
    apt-get install -y -qq \
    	r-cran-chron \
    	r-cran-shinyjs \
    	r-cran-shinybs \
    	r-cran-v8 \
    	r-cran-shinythemes \
    	r-cran-reticulate \
    	r-cran-plotly \
    	r-cran-reshape


RUN apt-get install -y \
    python3-pip \
    vim \
    libudunits2-dev \
    libgdal-dev \
    locales

# Set the locale
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8   

RUN Rscript -e "install.packages(c('leaflet','shinyTime', 'shinyalert','mapview'))"
