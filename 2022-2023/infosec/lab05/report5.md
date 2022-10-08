---
# Front matter
title: "Отчет по лабораторной работе №5"
subtitle: "Дискреционное разграничение прав в Linux. Исследование влияния дополнительных атрибутов"
author: "Лебедев Ярослав Борисович"
group: НФИбд-02-19
institute: РУДН, Москва

# Generic otions
lang: ru-RU
toc-title: "Содержание"

# Bibliography
csl: pandoc/csl/gost-r-7-0-5-2008-numeric.csl

# Pdf output format
toc: true # Table of contents
toc_depth: 2
lof: true # List of figures
fontsize: 12pt
linestretch: 1.5
papersize: a4
documentclass: scrreprt
### Fonts
mainfont: PT Serif
romanfont: PT Serif
sansfont: PT Sans
monofont: PT Mono
mainfontoptions: Ligatures=TeX
romanfontoptions: Ligatures=TeX
sansfontoptions: Ligatures=TeX,Scale=MatchLowercase
monofontoptions: Scale=MatchLowercase,Scale=0.9
## Biblatex
biblatex: true
biblio-style: "gost-numeric"
biblatexoptions:
  - parentracker=true
  - backend=biber
  - hyperref=auto
  - language=auto
  - autolang=other*
  - citestyle=gost-numeric
## Misc options
indent: true
header-includes:
  - \linepenalty=10 # the penalty added to the badness of each line within a paragraph (no associated penalty node) Increasing the value makes tex try to have fewer lines in the paragraph.
  - \interlinepenalty=0 # value of the penalty (node) added after each line of a paragraph.
  - \hyphenpenalty=50 # the penalty for line breaking at an automatically inserted hyphen
  - \exhyphenpenalty=50 # the penalty for line breaking at an explicit hyphen
  - \binoppenalty=700 # the penalty for breaking a line at a binary operator
  - \relpenalty=500 # the penalty for breaking a line at a relation
  - \clubpenalty=150 # extra penalty for breaking after first line of a paragraph
  - \widowpenalty=150 # extra penalty for breaking before last line of a paragraph
  - \displaywidowpenalty=50 # extra penalty for breaking before last line before a display math
  - \brokenpenalty=100 # extra penalty for page breaking after a hyphenated line
  - \predisplaypenalty=10000 # penalty for breaking before a display
  - \postdisplaypenalty=0 # penalty for breaking after a display
  - \floatingpenalty = 20000 # penalty for splitting an insertion (can only be split footnote in standard LaTeX)
  - \raggedbottom # or \flushbottom
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---

# Цель работы
Изучение механизмов изменения идентификаторов, применения
SetUID- и Sticky-битов. Получение практических навыков работы в консоли с дополнительными атрибутами. Рассмотрение работы механизма
смены идентификатора процессов пользователей, а также влияние бита
Sticky на запись и удаление файлов [1].

# Выполнение лабораторной работы
## Создание программы
1. Войдите в систему от имени пользователя guest (Рис.1).

2. Создайте программу simpleid.c (Рис.1 - Рис.2).

![Рис.1. Пункт 1-2](images/1-2.jpg)

![Рис.2. Пункт 2. Программа](images/2prog.jpg)

3. Скомплилируйте программу и убедитесь, что файл программы создан (Рис.3):
gcc simpleid.c -o simpleid

4. Выполните программу simpleid (Рис.3):
./simpleid

5. Выполните системную программу id (Рис.3):
id
и сравните полученный вами результат с данными предыдущего пункта
задания.

6. Усложните программу, добавив вывод действительных идентификаторов
Получившуюся программу назовите simpleid2.c (Рис.3 - Рис.4).

![Рис.3. Пункт 3-6](images/3-6.jpg)

![Рис.4. Пункт 6. Программа](images/6prog.jpg)

7. Скомпилируйте и запустите simpleid2.c (Рис.5)
gcc simpleid2.c -o simpleid2
./simpleid2

8. От имени суперпользователя выполните команды (Рис.5):
chown root:guest /home/guest/simpleid2
chmod u+s /home/guest/simpleid2

9. Используйте sudo или повысьте временно свои права с помощью su (Рис.5).
Поясните, что делают эти команды.

10. Выполните проверку правильности установки новых атрибутов и смены
владельца файла simpleid2 (Рис.5):
ls -l simpleid2

![Рис.5. Пункт 7-10](images/7-10.jpg)

11. Запустите simpleid2 и id:
./simpleid2
id
Сравните результаты (Рис.6).

![Рис.6. Пункт 11](images/11.jpg)

12. Проделайте тоже самое относительно SetGID-бита (Рис.7).

13. Создайте программу readfile.c (Рис.7 - Рис.8).

![Рис.7. Пункт 12-13](images/12-13.jpg)

![Рис.8. Пункт 13. Программа](images/13prog.jpg)

14. Откомпилируйте её (Рис.9).
gcc readfile.c -o readfile

15. Смените владельца у файла readfile.c (или любого другого текстового
файла в системе) и измените права так, чтобы только суперпользователь
(root) мог прочитать его, a guest не мог (Рис.9).

16. Проверьте, что пользователь guest не может прочитать файл readfile.c (Рис.9).

![Рис.9. Пункт 14-16](images/14-16.jpg)

17. Смените у программы readfile владельца и установите SetU’D-бит (Рис.10).

18. Проверьте, может ли программа readfile прочитать файл readfile.c? (Рис.10)

![Рис.10. Пункт 17-18](images/17-18.jpg)

19. Проверьте, может ли программа readfile прочитать файл /etc/shadow?
Отразите полученный результат и ваши объяснения в отчёте (Рис.11).

![Рис.11. Пункт 19](images/19.jpg)

## Исследование Sticky-бита

1. Выясните, установлен ли атрибут Sticky на директории /tmp, для чего
выполните команду (Рис.12)
ls -l / | grep tmp

2. От имени пользователя guest создайте файл file01.txt в директории /tmp
со словом test (Рис.12):
echo "test" > /tmp/file01.txt

3. Просмотрите атрибуты у только что созданного файла и разрешите чтение и запись для категории пользователей «все остальные» (Рис.12):
ls -l /tmp/file01.txt
chmod o+rw /tmp/file01.txt
ls -l /tmp/file01.txt

![Рис.12. Пункт 1-3. Исследование Sticky-бита](images/21-23.jpg)

4. От пользователя guest2 (не являющегося владельцем) попробуйте прочитать файл /tmp/file01.txt (Рис.13):
cat /tmp/file01.txt

5. От пользователя guest2 попробуйте дозаписать в файл
/tmp/file01.txt слово test2 командой (Рис.13)
echo "test2" > /tmp/file01.txt
Удалось ли вам выполнить операцию?

6. Проверьте содержимое файла командой (Рис.13)
cat /tmp/file01.txt

7. От пользователя guest2 попробуйте записать в файл /tmp/file01.txt
слово test3, стерев при этом всю имеющуюся в файле информацию командой (Рис.13)
echo "test3" > /tmp/file01.txt
Удалось ли вам выполнить операцию?

8. Проверьте содержимое файла командой (Рис.13)
cat /tmp/file01.txt

9. От пользователя guest2 попробуйте удалить файл /tmp/file01.txt командой
rm /tmp/fileOl.txt
Удалось ли вам удалить файл? (Рис.13)

10. Повысьте свои права до суперпользователя следующей командой (Рис.13)
su -
и выполните после этого команду, снимающую атрибут t(Sticky-бит) с
директории /tmp:
chmod -t /tmp

11. Покиньте режим суперпользователя командой (Рис.13)
exit

12. От пользователя guest2 проверьте, что атрибута t у директории /tmp
нет (Рис.13):
ls -l / | grep tmp

13. Повторите предыдущие шаги. Какие наблюдаются изменения? (Рис.13)

14. Удалось ли вам удалить файл от имени пользователя, не являющегося
его владельцем? Ваши наблюдения занесите в отчёт (Рис.13).

15. Повысьте свои права до суперпользователя и верните атрибут t на директорию /tmp (Рис.13):
su -
chmod +t /tmp
exit

![Рис.13. Пункт 4-15. Исследование Sticky-бита](images/24-215.jpg)

# Выводы
Изучил механизмы изменения идентификаторов, применения
SetUID- и Sticky-битов. Получил практические навыки работы в консоли с дополнительными атрибутами. Рассмотрел работы механизма
смены идентификатора процессов пользователей, а также влияние бита
Sticky на запись и удаление файлов.

# Список литературы
1. Методические материалы курса
