# Run evernote windows app in a container with wine
#
# docker run -d \
#	-v /tmp/.X11-unix:/tmp/.X11-unix  \
#	-e DISPLAY=unix$DISPLAY \
#	--name evernote \
#	thshaw/evernote
#

FROM thshaw/wine
MAINTAINER thshaw <tom@tomwillfixit.com>

COPY Evernote_5.8.13.8152.exe /usr/src/evernote.exe
COPY start.sh /evernote/start.sh
COPY winefontsmothing_en.sh /evernote/winefontsmothing_en.sh
COPY msstyles /evernote/msstyles
COPY gnome-wine-color-scraper /evernote/gnome-wine-color-scraper

# RUN echo "Starting font smothing..."
# RUN chmod +x /evernote/winefontsmothing_en.sh
# RUN /evernote/winefontsmothing_en.sh
# RUN echo "Font smothing done!"
# RUN chmod +x /evernote/start.sh
# RUN /evernote/start.sh

ENTRYPOINT ["bash", "/evernote/start.sh"]
# ENTRYPOINT ["wine", "/usr/src/evernote.exe"]

# echo "Installing python dependencies"
# sudo apt-get install -y build-essential
# sudo apt-get install -y libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev
# echo "Downloading python..."
# wget -P /tmp/python https://www.python.org/ftp/python/2.7.10/Python-2.7.10.tgz
# echo "Extracting python..."
# tar -xvf /tmp/python/Python-2.7.10.tgz --directory /tmp/python
# cd /tmp/python/Python-2.7.10
# echo "Installing python..."
# ./configure
# make
# sudo make install

# echo "Scraping Gnome colors to wine..."
# chmod +x /evernote/gnome-wine-color-scraper/wine_colors_from_gtk.py
# /evernote/gnome-wine-color-scraper/wine_colors_from_gtk.py
