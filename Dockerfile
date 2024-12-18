# Создание образа "docker_tests"
# 1. для сборки образа выполнить: docker build . -t docker_tests
# 2. для сборки контейнера выполнить: docker run --rm -v D:\PycharmProjects\Multilanguage\allure-results:/allure-results docker_tests
# 3. для просмотра Allure-отчета выполнить: allure serve allure-results

FROM python:3.10-alpine3.19
WORKDIR usr/workspace
COPY . usr/workspace
RUN apk add --no-cache chromium chromium-chromedriver tzdata
RUN pip install -r requirements.txt
RUN mkdir usr/workspace/allure-results
CMD ["pytest", "-v", "tests", "--alluredir=allure-results"]
