# count-svc
Simple web service for counting words on a site

#### Требования:
- Docker
- docker-compose

Запуск элементарный:
- клонируем репозиторий
- в папке репозитория:
    - собираем образы: sudo docker-compose build
    - подымаем полученный проект: sudo docker-compose up

    - остановить sudo docker-compose stop
    - возобновить sudo docker-compose start

После выполнения приведенной выше команды, вы можете получить доступ к приложению на http://localhost:5500

Общение между контейнерами идет по внутренней сети Docker, с внешним миром связан только контейнер вебсервиса по порту 5500

На данный момент задачу по обновлению результатов с помощью nsq НЕ ВЫПОЛНЯЛ, много потратил времени на изучение и поиск материалов по celery и flask, а так же долго разбирался, как это все поселить в Docker

В итоге получилось 4 контейнера:
- База данных
- Redis
- Worker(я его обозвал wocker :-) )
- Веб сервис
