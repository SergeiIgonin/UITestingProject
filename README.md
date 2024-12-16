Небольшой демонстрационный WEB проект по автоматизации тестирования UI. 
1. Установить зависимости:
```bash
pip install -r requirements.txt
```
2. Запустить только smoke-тесты (5 шт):
```bash
pytest -vm "smoke"
```
3. Запустить все тесты в разных браузерах (chrome или firefox), с указанием языка интерфейса.

    *(i) headless-режим можно отключить в conftest.py убрав эту опцию*
```bash
pytest -sv --browser_name=chrome --language=ru
```
```bash
pytest -sv --browser_name=firefox --language=en
```
*(i) Вы также можете указать любой другой поддерживаемый язык: es для испанского, fr для французского.
(по умолчанию выставлен chrome, en)*
4. Запустить все тесты с генерацией и просмотром allur-отчета по итогам прогона тестов (выполнять поочередно):
```bash
pytest -v --alluredir=allure-results
```
```bash
allure serve allure-results 
```
5.  При наличии на вашем ПК установленного и запущенного DockerDesktop вы можете смонтировать docker-образа на основе docker-файла:
```bash
docker build . -t docker_ui_tests     
```
Теперь из этого образа можно запустить контейнер с прогоном тестов внутри него:
```bash
docker run --rm -v D:*абсолютный путь к папке allure-results*:/allure-results docker_ui_tests
```
По завершению прогона тестов внутри контейнера в корневой директории данного проекта на вашем ПК автоматически создастся папка
allure-results из которой можно будет сгенерировать и просмотреть allure-отчет:
```bash
allure serve allure-results 
```
6. Для запуска тестов удаленно на  GitHub откройте там данный репозиторий, перейдите во вкладку "Actions", откройте Actions
**"Automated WEB UI tests"**, выберите и запустите один из четырех вариантов workflow.
