**Демонстрационный проект по автоматизации тестирования  WEB UI.** 

Перед запуском автотестов необходимо клонировать данный репозиторий в IDE на вашем ПК, выполнив в его терминале команду:
**git clone https://github.com/SergeiIgonin/UITestingProject.git**
затем перейти в его директорию: **cd UITestingProject**

1. Установка зависимостей:
```bash
pip install -r requirements.txt
```
2. Запуск smoke-автотестов (5 шт):
```bash
pytest -vm "smoke"
```
3. Запуск всех автотестов (17 шт.) в браузере chrome или firefox с указанием языка интерфейса (опционально).

    *(i) headless-режим можно отключить в conftest.py закомментировав опцию '--headless=new'*
```bash
pytest -sv --browser_name=chrome --language=ru
```
```bash
pytest -sv --browser_name=firefox --language=en
```
*(i) также можно указать любой другой поддерживаемый язык: es для испанского, fr для французского
(по умолчанию выставлены chrome, en)*

4. Запуск всех тестов с генерацией и просмотром allur-отчета по итогам прогона тестов (выполнять поочередно):
```bash
pytest -v --alluredir=allure-results
```
```bash
allure serve allure-results 
```
5.  При наличии на вашем ПК установленного и запущенного DockerDesktop вы также можете смонтировать docker-образ на основе docker-файла. 
```bash
docker build . -t docker_ui_tests     
```
Для запуска автотестов внутри запущенного docker-контейнера в команде нужно указать абсолютный путь до папки
allure-results, которая будет создана в корне проекта автоматически
```bash
docker run --rm -v D:*абсолютный путь к папке allure-results*:/allure-results docker_ui_tests
```
После прохождения тестов в docker-контейнере в корневой директории проекта автоматически создастся папка
allure-results из которой можно сгенерировать allure-отчет:
```bash
allure serve allure-results 
```
6. Для запуска тестов удаленно на виртуальных машинах GitHub перейдите во вкладку "Actions" данного репозитория, выберите Actions
**"Automated WEB UI tests"**, затем выберите и запустите один из четырех вариантов workflow.
