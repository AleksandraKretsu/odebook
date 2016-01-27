======= Автономные дифференциальные уравнения на прямой =======

В этой главе мы будем рассматривать дифференциальные уравнения вида

!bt
\begin{equation}
label{eq:2:general}
\dot x = f(t, x),
\end{equation}
!et
где $x\colon D \to \mathbb R$ — неизвестная функция, $D$ — связное подмножство прямой (вся прямая,
луч, отрезок, полуинтервал, интервал), $f\colon D\times \mathbb R\to \mathbb R$
— некоторая по меньшей мере непрерывная (а лучше бы гладкая, как мы увидим чуть
позже) функция от двух переменных.

Напомним, что решением уравнения (ref{eq:2:general}) называется дифференцируемая
функция $\ph$, такая, что выполнено тождество
!bt
\[
\dot \ph(t)=f(\ph(t),t)\quad \forall t \in D
\]
!et
<%doc>
_Поле направлений_:
Вместе с каждым дифференциальным уравнением связано *поле направлений* — картинка, на которой через каждую точку проведена прямая, угловой коэффициент которой равен значению функции $f(t, x)$. Понятно, что такие прямые — это всеовозможные касательные к решениям уравнения.

Приведем пример для дифференциального уравнения $\dot x = t$:

!bc pycod
axes4x4()
rcParams['figure.figsize']=(8,6)
normdirfield(arange(-4,4,0.5),arange(-4,4,0.5),lambda t,x: t,color='red',linewidth=1,length=0.6)
!ec
Даже просто посмотрев на этот график, то видно, что решением этого уравнение должна быть парабола (либо функция, очень похожая на параболу). Синим изображена *интегральная кривая* этого дифференциального уравнения.

!bc pycod
axes4x4()
normdirfield(arange(-4,4,0.5),arange(-4,4,0.5),lambda t,x: t,color='red',linewidth=1,length=0.4)
mplot(linspace(-4,4),lambda x: x**2/2, color='blue')
!ec
Напомним также, как выглядит поле направлений и интегральные кривые для уравнения $\dot x=x$:

!bc pycod
axes4x4()
normdirfield(arange(-4,4,0.5),arange(-4,4,0.5),lambda t,x: x,color='red',linewidth=1,length=0.6)
mplot(linspace(-4,4),lambda t: exp(t), color='blue')
!ec
</%doc>

===== Численное решение дифференциальных уравнений. Метод Эйлера =====
Пусть поставлена ${snippet(u"задача Коши", "cauchy")}:
!bt
\begin{equation}
label{eq:2:Cauchy}
\dot x=f(t, x),\quad x(t_0)=x_0.
\end{equation}
!et
Мы можем приблизительно решать её таким образом. Возьмём произвольную точку $(t_0, x_0)$ расширенного фазового пространства. Интегральная кривая, проходящая через эту точку, имеет в ней касательную с угловым коэффициентом $f(t_0, x_0)$. Касательная — это прямая, которая хорошо приближает график функции. Давайте на секундочку представим, что ${snippet(u"интегральная кривая","integral_curve")} в точности совпадает с касательной на некотором небольшом промежутке, содержащем точку $t_0$. (Иными словами, на этом промежутке мы двигаемся с постоянной скоростью.) Отступим от точки $t_0$ вправо на некоторую маленькую величину $\Delta t$ и рассмотрим точку $(x_1, t_1)$, построенную следующим образом:
!bt
\begin{align*}
x_1&=x_0+f(x_0,t_0)\cdot \Delta t\\\
t_1&=t_0+\Delta t
\end{align*}
!et
Она лежит на касательной, проходящей через точку $(t_0, x_0)$. Если $\Delta t$ мало, эта точка должна лежать близко к графику настоящего решения. Теперь мы можем взять точку $(t_1, x_1)$ за стартовую, построить в ней уже новую касательную, и пройти по этой касательной ещё на $\Delta t$ вправо. Действуя таким образом, получим набор точек, связанных соотношением:
!bt
\begin{align*}
x_{n+1}=x_n+f(t_n, x_n)+\Delta t \\\
t_{n+1}=t_{n}+\Delta t=t_0+(n+1)\Delta t
\end{align*}
!et
Если соединить эти точки отрезками прямых, они будут проходить вблизи касательных к решению, и сама получающаяся ломаная будет приближаться к настоящему решению. Естественно, с уменьшением шага точность приближения увеличивается.
На рис. ref{fig:l02_euler} синим изображено истинное решение уравнения $\dot x = t$ с начальным условием $x(-3)=4$, а красным, розовым, фиолетовым и зеленым изображены численные решения уравнения методом Эйлера 5, 10, 20 и 100 шагами соответственно.

<%
if needfigure("l02_euler"):
    no.axes4x4()
    no.eulersplot(lambda t,x: t, -3, 4, 4, 5, color='red')
    no.eulersplot(lambda t,x: t, -3, 4, 4, 10, color='pink')
    no.eulersplot(lambda t,x: t, -3, 4, 4, 20, color='purple')
    no.eulersplot(lambda t,x: t, -3, 4, 4, 100, color='green')
    no.mplot(no.linspace(-4,4),lambda x: x**2/2-0.5, color='blue')
    savefigs()
%>

${mkfig(u"Приближённые решения")}

Заметим, что уже сто шагов дает достаточно хорошее приближение решения.

##===== {Exercise}: Задача: приближение числа $e$ =====
=== Упражнение ===
Найти число $e$, зная, что функция $x=e^t$ удовлетворяет дифференциальному уравнению $\dot x = x$ и начальному условию $x(0) = 1$.

===== Аналитическое решение автономных дифференциальных уравнений на прямой =====

__Определение.__ *Автономным* называется дифференциальное уравнение, правая
часть которого не зависит от времени явно. Такое уравнение
имеет вид
!bt
\begin{equation}
label{eq:2:auto}
\dot x=f(x)
\end{equation}
!et
##end:def
Рассмотрим задачу Коши для автономного дифференциального уравнения
(ref{eq:2:auto}) с
начальным условием $x(t_0)=x_0$.

Пусть $x=\ph(t)$ — решение этой задачи, и $(t_1, x_1)$ — некоторая точка, лежащая на его графике. В этом случае $x_1=\ph(t_1)$. Пусть $f(x_1)\ne 0$.

Рассмотрим функцию $t=\psi(x)$, обратную к функции $x=\ph(t)$. Тогда по теореме о производной сложной функции,

!bt
\[
\psi'(x_1)=\frac{d\psi(x_1)}{dx}=\frac{1}{\dot \ph(t_1)}=\frac{1}{f(x_1)}
\]
!et
Это равенство выполняется в любой точке $x_1$. Значит, функция $\psi$ является решением дифференциального уравнения
!bt
\[
\psi'(x)=\frac{1}{f(x)},
\]
!et
где $x$ выступает в роли независимой переменной. Правая часть теперь не зависит от неизвестной функции и такое уравнение мы умеем решать:
!bt
\[
\psi(x)=\int_{x_0}^x \frac{dx}{f(x)}+t_0
\]
!et
Вспоминая, что $t=\psi(x)$ — обратная функция к решению $x=\ph(t)$, имеем:
!bt
\[
t-t_0=\int_{x_0}^{\ph(t)} \frac{dx}{f(x)}
\]
!et
Эта формула называется _формулой Барроу_. Её можно понимать так: если $f(x)$ — это скорость движения в точке $x$, то время, необходимое для попадания из точки $x_0$ в точку $x$, вычисляется как интеграл от величины, обратной скорости. Кажется, довольно убедительно.

Это соотношение можно понимать как неявное выражение функции $\ph(t)$, то есть решения.

Часто используют такую символическую запись:

!bt
\begin{align*}
\dot x&=f(x)\\
\frac{dx}{dt}&=f(x)\\
\frac{dx}{f(x)}&=dt\\
\int_{x_0}^x \frac{dx}{f(x)}&=\int_{t_0}^t dt
\end{align*}
!et
*Промежуточные действия сейчас могут показаться магией, но чуть позже мы дадим строгие определения, которые нужны, чтобы её понять.*
=== Пример ===
Решим уравнение $\dot x=x$ с начальным условием $x(t_0)=x_0$. Пусть $x=\ph(t)$ —
решение и $t=\ph^{-1}(x)$ — обратная функция к решению. Имеем:

!bt
\begin{align*}
&(\ph^{-1}(x))'=\frac{1}{x}\\
&\ph^{-1}(x) = \psi (x)\\
&\psi' (x)  = \frac 1 x\\
&\psi (x) = \int \frac{dx} x = \ln |x| + C\\
&t=\ln|x|+C\\
&x = \pm e^{-C}e^t = C_1 e^t
\end{align*}
!et
Заметим, что если бы мы забыли модуль под логарифмом при интегрировании, то константа $C_1=e^{-C}$ принимала бы только положительные значения. Но из-за модуля она может принимать и отрицательные значения.
Заметим также, что в ходе преобразований (деления на $x$) мы «потеряли» решение $x=0$. Если в ответ подставить значение $C_1=0$, получим как раз его. Таким образом, формула $x(t)=Ce^t$, $c\in \mathbb R$ даёт все известные нам решениям. (Мы пока не доказали, что других нет — на следующей лекции мы обсудим этот вопрос.)
