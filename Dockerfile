# build stage
FROM swaggerapi/swagger-codegen-cli:2.4.26 AS build
COPY ./swagger.yml /app/
WORKDIR /app/
RUN java -jar /opt/swagger-codegen-cli/swagger-codegen-cli.jar validate \
  -i ./swagger.yml && \
  java -jar /opt/swagger-codegen-cli/swagger-codegen-cli.jar generate \
  -i ./swagger.yml \
  -l nodejs-server \
  -o ./

# run
FROM node:17-alpine
COPY --from=build /app/ /usr/local/bin/mock-api/
WORKDIR /usr/local/bin/mock-api/
CMD ["npm", "start"]
