# testReadmeProfi

Тестовое задание для PROFI.<br>

### Техническое задание
* Архитектура VIPER;
* Минимальная версия ОС - 12;
* Язык - Swift;
* Бес использования сторонних библиотек;
* Приложение должно загружать список друзей для любого пользователя ВК (https://vk.com/dev/friends.get).
* UI:
  + Сверху поле ввода id пользователя;
  + Снизу таблица с ячейками друзей;
  + В ячейке "друга" отображается имя и аватарка.
* При тапе на ячейку "друга" загружать список его друзей.

### Структура
* View - Слой отображения:
  + ViewController;
  + TableManager - управление таблицей;
  + Cell - ячейка таблицы.
* Presenter - Обработка UI;
* Interactor - бизнес-логика;
* Entity - вспомогательные сущности;
* Router - навигация;
* Configurator - управление зависимостями VIPER-модуля;
* Network - сетевой слой:
  + Commands - сетевые команды.
* Extensions - расширения для существующих классов.

Для использования приложения необходимо в файле Config для переменной VK_ACCESS_TOKEN вместо "INSERT_TOKEN_HERE" подставить токен.<br>
Для удобства добавлено значение id по умолчанию.<br>

Работа приложения:<br>
![Alt Text](https://github.com/v-nereutsa/testReadmeProfi/blob/main/app.gif)
