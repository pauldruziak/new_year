[![Build Status](https://semaphoreci.com/api/v1/projects/ae5b998c-17df-490f-9d2f-d1fd5ba6f189/672702/shields_badge.svg)](https://semaphoreci.com/paveldruzyak/new_year)
[![Code Climate](https://codeclimate.com/github/paveldruzyak/new_year/badges/gpa.svg)](https://codeclimate.com/github/paveldruzyak/new_year)
[![Coverage Status](https://coveralls.io/repos/github/paveldruzyak/new_year/badge.svg?branch=master)](https://coveralls.io/github/paveldruzyak/new_year?branch=master)


Этот скрипт помогает нам дарить тайные подарки друзьям на Новый год. Он
случайным образом определяет кто и кому дарит подарок, и сообщает это
через email.

Установка
---------
Для начала установи ruby и rubygem. 
Если bundler не установлен, тогда:
    
    gem install bundler
    
Далее, установи дополнительные библиотеки при помощи:

    bundle install

Настройка
---------
Создай в корне файл emails.txt и внеси в него все нужные адреса, каждый
адрес с новой строчки, например:

    first@example.com
    second@example.com

Запуск
------
Все готово. Теперь запусти скрипт и он разошлет всем указанным адресам
инструкцию.

    ruby new_year.rb
