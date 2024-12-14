---
title: Digital Communications - Lab 2b Questionnaire
---

<style>
:root {
    --markdown-font-family: "Times New Roman", Times, serif;
    --markdown-font-size: 10.5pt;
}
</style>

<p class="supt1 center">Digital Communications</p>

# Quiz for Lab exercise 2 (B): OFDM Modulation

<p class="subt2 center">
Academic year 2024/2025
</p>

| Student names               |
| --------------------------- |
| Alonso Herreros Copete      |
| Alicia Silveira Cela        |
| Yago Fernando Mestre Feijóo |
|                             |

> **Note**
>
> The following git repository contains the code and data for this lab:  
> <https://github.com/alonso-herreros/uni-dcom-lab2b>

---

* [1. OFDM without cyclic prefix](#1-ofdm-without-cyclic-prefix)
    * [Ideal channel](#ideal-channel)
    * [Channel 2 (1)](#channel-2-1)
* [2. OFDM with cyclic prefix](#2-ofdm-with-cyclic-prefix)
    * [Noisseless](#noisseless)
    * [With noise](#with-noise)
    * [Optimal C](#optimal-c)

---

Fill in the data obtained in your simulations and give a reasoned answer to the questions.

## 1. OFDM without cyclic prefix

Regarding the value of equivalent discrete channels, discuss the difference
between transmission through an ideal channel or through the channel given in
(1).

> **Answer**
>
> Whenever we are not using an ideal channel there are ISI and ICI, which
> increase the probability of error.

Fill these tables:

### Ideal channel

| $k$   | $P_e$         |    $\qquad\qquad$     | $k$    | $P_e$         |
| :---- | :------------ | :-------------------: | :----- | :------------ |
| $k=0$ | $P_e=0.00661$ |                       | $k=8$  | $P_e=0.0066$  |
| $k=1$ | $P_e=0.00694$ |                       | $k=9$  | $P_e=0.007$   |
| $k=2$ | $P_e=0.00713$ |                       | $k=10$ | $P_e=0.00677$ |
| $k=3$ | $P_e=0.00669$ |                       | $k=11$ | $P_e=0.00725$ |
| $k=4$ | $P_e=0.00761$ |                       | $k=12$ | $P_e=0.00722$ |
| $k=5$ | $P_e=0.00654$ |                       | $k=13$ | $P_e=0.00754$ |
| $k=6$ | $P_e=0.00684$ |                       | $k=14$ | $P_e=0.00701$ |
| $k=7$ | $P_e=0.00699$ |                       | $k=15$ | $P_e=0.00743$ |
|       |               | Average $P_e=0.00706$ |        |               |

### Channel 2 (1)

| $k$   | $P_e$         |    $\qquad\qquad$     | $k$    | $P_e$         |
| :---- | :------------ | :-------------------: | :----- | :------------ |
| $k=0$ | $P_e=0.40203$ |                       | $k=8$  | $P_e=0.78158$ |
| $k=1$ | $P_e=0.46318$ |                       | $k=9$  | $P_e=0.5618$  |
| $k=2$ | $P_e=0.66313$ |                       | $k=10$ | $P_e=0.63374$ |
| $k=3$ | $P_e=0.71506$ |                       | $k=11$ | $P_e=0.73861$ |
| $k=4$ | $P_e=0.5061$  |                       | $k=12$ | $P_e=0.5085$  |
| $k=5$ | $P_e=0.73702$ |                       | $k=13$ | $P_e=0.71553$ |
| $k=6$ | $P_e=0.63663$ |                       | $k=14$ | $P_e=0.65968$ |
| $k=7$ | $P_e=0.56135$ |                       | $k=15$ | $P_e=0.46118$ |
|       |               | Average $P_e=0.60907$ |        |               |

## 2. OFDM with cyclic prefix

Fill the tables

### Noisseless

| $C$   | $P_e$              | $\qquad\qquad$ | $C$    | $P_e$        |
| :---- | :----------------- | :------------: | :----- | :----------- |
| $C=1$ | Avg. $P_e=0.51487$ |                | $C=6$  | Avg. $P_e=0$ |
| $C=2$ | Avg. $P_e=0.42001$ |                | $C=7$  | Avg. $P_e=0$ |
| $C=3$ | Avg. $P_e=0.31723$ |                | $C=8$  | Avg. $P_e=0$ |
| $C=4$ | Avg. $P_e=0.16886$ |                | $C=9$  | Avg. $P_e=0$ |
| $C=5$ | Avg. $P_e=0$       |                | $C=10$ | Avg. $P_e=0$ |

### With noise

| $C$   | $P_e$              | $\qquad\qquad$ | $C$    | $P_e$              |
| :---- | :----------------- | :------------: | :----- | :----------------- |
| $C=1$ | Avg. $P_e=0.53490$ |                | $C=5$  | Avg. $P_e=0.09847$ |
| $C=2$ | Avg. $P_e=0.45128$ |                | $C=7$  | Avg. $P_e=0.09857$ |
| $C=3$ | Avg. $P_e=0.36460$ |                | $C=8$  | Avg. $P_e=0.09840$ |
| $C=4$ | Avg. $P_e=0.24508$ |                | $C=9$  | Avg. $P_e=0.09846$ |
| $C=5$ | Avg. $P_e=0.09870$ |                | $C=10$ | Avg. $P_e=0.09856$ |

### Optimal C

Choose the optimal cyclic prefix length, relating it to the performance and bandwidth required for transmission at a given rate.

> **Answer**
>
> The optimal cyclic prefix length seems to be 5. After that, in an ideal
> channel, we don’t get any better error probabilities, but we have to transmit
> more symbols, which means we would use less of the available bandwidth. We’ll
> use the ideal $C=5$

For the optimal cyclic prefix length, fill in this table and explain the results obtained.

| $k$   | $P_e$         |    $\qquad\qquad$     | $k$    | $P_e$         |
| :---- | :------------ | :-------------------: | :----- | :------------ |
| $k=0$ | $P_e=0$       |                       | $k=8$  | $P_e=0.59380$ |
| $k=1$ | $P_e=0$       |                       | $k=9$  | $P_e=0.04433$ |
| $k=2$ | $P_e=0.00001$ |                       | $k=10$ | $P_e=0.10003$ |
| $k=3$ | $P_e=0.07692$ |                       | $k=11$ | $P_e=0.26865$ |
| $k=4$ | $P_e=0.00200$ |                       | $k=12$ | $P_e=0.00193$ |
| $k=5$ | $P_e=0.26637$ |                       | $k=13$ | $P_e=0.07709$ |
| $k=6$ | $P_e=0.09937$ |                       | $k=14$ | $P_e=0$       |
| $k=7$ | $P_e=0.04469$ |                       | $k=15$ | $P_e=0$       |
|       |               | Average $P_e=0.09844$ |        |               |
