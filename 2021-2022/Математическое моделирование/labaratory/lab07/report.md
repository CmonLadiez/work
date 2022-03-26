---
# Front matter
title: "Отчет по лабораторной работе №7"
subtitle: "Эффективность рекламы"
author: "Лебедев Ярослав Борисович"
group: НФИбд-02-19
institute: РУДН, Москва
date: 2022 Mar 22th

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
Построить графики распространения рекламы для трех случаев. Для
случая 2 определите в какой момент времени скорость распространения рекламы будет
иметь максимальное значение. Для этого написать программу в OpenModelica.

# Задание
Вариант 15. Постройте график распространения рекламы, математическая модель которой описывается
следующим уравнением (формула условия):

![Формула условия](images/0.jpg "Формула условия")

При этом объем аудитории N=1500, в начальный момент о товаре знает 15 человек. Для
случая 2 определите в какой момент времени скорость распространения рекламы будет
иметь максимальное значение.

# Теоретическое введение
Организуется рекламная кампания нового товара или услуги. Необходимо,
чтобы прибыль будущих продаж с избытком покрывала издержки на рекламу.
Вначале расходы могут превышать прибыль, поскольку лишь малая часть
потенциальных покупателей будет информирована о новинке. Затем, при
увеличении числа продаж, возрастает и прибыль, и, наконец, наступит момент,
когда рынок насытиться, и рекламировать товар станет бесполезным [1].

Предположим, что торговыми учреждениями реализуется некоторая
продукция, о которой в момент времени t из числа потенциальных покупателей N
знает лишь n покупателей. Для ускорения сбыта продукции запускается реклама
по радио, телевидению и других средств массовой информации. После запуска
рекламной кампании информация о продукции начнет распространяться среди
потенциальных покупателей путем общения друг с другом. Таким образом, после
запуска рекламных объявлений скорость изменения числа знающих о продукции
людей пропорциональна как числу знающих о товаре покупателей, так и числу
покупателей о нем не знающих.

Модель рекламной кампании описывается следующими величинами.
Считаем, что dn/dt - скорость изменения со временем числа потребителей,
узнавших о товаре и готовых его купить,t - время, прошедшее с начала рекламной
кампании, n(t) - число уже информированных клиентов. Эта величина
пропорциональна числу покупателей, еще не знающих о нем, это описывается
следующим образом: a_1(t)(N-n(t)), где N - общее число потенциальных
платежеспособных покупателей, a_1(t)>0 - характеризует интенсивность
рекламной кампании (зависит от затрат на рекламу в данный момент времени).
Помимо этого, узнавшие о товаре потребители также распространяют полученную
информацию среди потенциальных покупателей, не знающих о нем (в этом случае
работает т.н. сарафанное радио). Этот вклад в рекламу описывается величиной a_2(t)n(t)(N-n(t)), эта величина увеличивается с увеличением потребителей
узнавших о товаре. Математическая модель распространения рекламы описывается
уравнением (формула 1):

![Формула (1)](images/1.jpg "Формула (1)")

При a_1(t) >> a_2(t) получается модель типа модели Мальтуса, решение которой
имеет вид (Рис.1):

![Рис.1: График решения уравнения модели Мальтуса](images/2.jpg "Рис.1: График решения уравнения модели Мальтуса")

В обратном случае, при a_1(t) << a_2(t) получаем уравнение логистической
кривой (Рис.2):

![Рис.2: График логистической кривой](images/3.jpg "Рис.2: График логистической кривой")

# Выполнение лабораторной работы
Работу я выполнял в OpenModelica. Для решения поставленной задачи необходимо было написать программу (Рис.3).

![Рис.3. Программа](images/4.jpg "Рис.3. Программа")

Результаты выполнения программы при первом условии (Рис.4).

![Рис.4.График при первом условии](images/5.jpg "Рис.4.График при первом условии")

Результаты выполнения программы при втором условии (Рис.5-6). Cкорости распространения рекламы при втором условии будет в максимуме практически сразу после начала.

![Рис.5. График при втором условии](images/6.jpg "Рис.5. График при втором условии")

![Рис.6. График скорости распространения рекламы при втором условии](images/7.jpg "Рис.6. График скорости распространения рекламы при втором условии")

Результаты выполнения программы при третьем условии (Рис.7).

![Рис.7. График при третьем условии](images/8.jpg "Рис.7. График при третьем условии")

# Выводы
Построены графики распространения рекламы для трех случаев. Для
случая 2 определено в какой момент времени скорость распространения рекламы будет
иметь максимальное значение. Для этого написана программа в OpenModelica.

# Список литературы
1. Методические материалы курса
