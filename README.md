Задача  

Нужен башевский скрипт для замерa производительности, ОС Centos 7.
Первый шаг в скрипте. Скачивается пакет stress-ng.
Если уже есть пакет в папке, не скачивается. Сообщение, что уже есть
**Важно: установка из пакета (интернета потом не будет)**  
Задается переменная для выбора номера сценария проверки. Должен быть аргумент у утилиты для заполнения этой переменной.  
Вывод каждого сценария идет в свой лог (дописывается при перезапуске). В логе должно быть указано время снятия показателей.  
При запуске утилиты на экран выводится номер выбранного сценария с названием и, если тест не упал, сколько строк записалось в лог + название лога. Если упал, выводится ошибка  

- Сценарий 1. Тестирование процессора
stress-ng --cpu 16 (это параметр, кол-во потоков, по умолчанию - 16) --cpu-method matrixprod --metrics --timeout 60  

- Сценарий 2. Низкоуровневое тестирование дисковой подсистемы  
stress-ng --sequential 0 --class io --timeout 60s --metrics-brief  

- Сценарий 3. Стресс-тест дисков  
stress-ng --hdd 5 (параметр, кол-во стрессоров, по умолч 5) --hdd-ops 100000 (кол-во bogo-операций, по умолч 100 тыс.)  

- Сценарий 4. Тестирование памяти  
stress-ng --sequential 0 --class memory --timeout 60s --metrics-brief  

- Сценарий 5. Комплексное тестирование  
stress-ng --sequential 0 --timeout 60s --metrics-brief  