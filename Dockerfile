FROM node:8.15 as build

RUN npm install -g bower grunt-cli \
	&& adduser sheet

COPY . /sheet
WORKDIR /sheet
RUN chmod -R 775 /sheet && chown -R sheet /sheet

USER sheet

RUN npm install && bower install && grunt build

EXPOSE 5000
CMD node server/web.js
