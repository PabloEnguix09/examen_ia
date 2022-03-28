(deffacts problema (robot cajas maximo 3 actual 0 palet pedidos caja naranjas 2 caja manzanas 3 caja uvas 1 palets palet pedidos palet naranjas palet manzanas palet caquis palet uvas))

(defrule coger-caja
    (robot cajas $?cajas maximo 3 actual ?actual palet pedidos $?ini caja ?tipoCaja ?numeroCajas $?fin)
    (test (<= (+ ?actual ?numeroCajas) 3))
    =>
    (assert (robot cajas $?cajas caja ?tipoCaja ?numeroCajas maximo 3 actual (+ ?actual ?numeroCajas) palet pedidos $?ini $?fin))
)

(defrule dejar-caja-naranjas
    (robot cajas $?cajas naranjas ?cuantas $?restoCajas maximo 3 actual ?actual palet naranjas $?pedidos)
    =>
    (assert (robot cajas $?cajas $?restoCajas maximo 3 actual (- ?actual ?cuantas) palet naranjas $?pedidos))
    (assert (palet pedidos palet naranjas ?cuantas palet manzanas palet caquis palet uva))
)

(defrule dejar-caja-manzanas
    (robot cajas $?cajas manzanas ?cuantas $?restoCajas maximo 3 actual ?actual palet manzanas $?pedidos)
    =>
    (assert (robot cajas $?cajas $?restoCajas maximo 3 actual (- ?actual ?cuantas) palet manzanas $?pedidos))
    (assert (palet pedidos palet naranjas palet manzanas ?cuantas palet caquis palet uva))
)

(defrule dejar-caja-uvas
    (robot cajas $?cajas uvas ?cuantas $?restoCajas maximo 3 actual ?actual palet uvas $?pedidos)
    =>
    (assert (robot cajas $?cajas $?restoCajas maximo 3 actual (- ?actual ?cuantas) palet uvas $?pedidos))
    (assert (palet pedidos palet naranjas palet manzanas palet caquis palet uvas ?cuantas))
)