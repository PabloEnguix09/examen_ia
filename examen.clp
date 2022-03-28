(deffacts problema (robot cajas maximo 3 actual 0 palet pedidos pedidos caja naranjas 2 caja manzanas 3 caja uvas 1 palets palet linea palet naranjas palet manzanas palet caquis palet uvas))

(defrule coger-caja
    (robot cajas $?cajas maximo 3 actual ?actual palet pedidos $?ini caja ?tipoCaja ?numeroCajas $?fin)
    (test (<= (+ ?actual ?numeroCajas) 3))
    =>
    (assert (robot cajas $?cajas caja ?tipoCaja ?numeroCajas maximo 3 actual (+ ?actual ?numeroCajas) palet pedidos $?ini $?fin))
)

(defrule mover-robot-naranjas
    (robot cajas $?cajas naranjas ?cuantas $?restoCajas maximo 3 actual ?actual palet ?paletActual $?resto)
    =>
    (assert(robot cajas $?cajas naranjas ?cuantas $?restoCajas maximo 3 actual ?actual palet naranjas $?resto))
)
(defrule dejar-caja-naranjas
    (robot cajas $?cajas naranjas ?cuantas $?restoCajas maximo 3 actual ?actual palet naranjas pedidos $?pedidos palets $?ini palet naranjas $?fin)
    =>
    (assert (robot cajas $?cajas $?restoCajas maximo 3 actual (- ?actual ?cuantas) palet naranjas pedidos $?pedidos palets palet pedidos palet naranjas ?cuantas palet manzanas palet caquis palet uva))
)

(defrule mover-robot-manzanas
    (robot cajas $?cajas manzanas ?cuantas $?restoCajas maximo 3 actual ?actual palet ?paletActual $?resto)
    =>
    (assert(robot cajas $?cajas manzanas ?cuantas $?restoCajas maximo 3 actual ?actual palet manzanas $?resto))
)
(defrule dejar-caja-manzanas
    (robot cajas $?cajas manzanas ?cuantas $?restoCajas maximo 3 actual ?actual palet manzanas pedidos $?pedidos palets $?ini palet manzanas $?fin)
    =>
    (assert (robot cajas $?cajas $?restoCajas maximo 3 actual (- ?actual ?cuantas) palet manzanas pedidos $?pedidos palets $?ini palet manzanas ?cuantas $?fin))
)

(defrule mover-robot-uvas
    (robot cajas $?cajas uvas ?cuantas $?restoCajas maximo 3 actual ?actual palet ?paletActual $?resto)
    =>
    (assert(robot cajas $?cajas uvas ?cuantas $?restoCajas maximo 3 actual ?actual palet uvas $?resto))
)
(defrule dejar-caja-uvas
    (robot cajas $?cajas uvas ?cuantas $?restoCajas maximo 3 actual ?actual palet uvas pedidos $?pedidos palets $?ini palet uvas $?fin)

    =>
    (assert (robot cajas $?cajas $?restoCajas maximo 3 actual (- ?actual ?cuantas) palet uvas pedidos $?pedidos palets $?ini palet uvas ?cuantas $?fin))
)