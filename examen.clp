(deffacts problema (robot cajas maximo 3 actual 0 palet pedidos pedidosLinea caja naranjas 2 caja manzanas 3 caja uvas 1 linea naranjas manzanas caquis uvas))


(defrule mover-robot-linea
    (robot cajas $?cajas maximo 3 actual ?actual palet ?paletActual $?resto)
    =>
    (assert(robot cajas $?cajas maximo 3 actual ?actual palet pedidos $?resto))
)
(defrule coger-caja
    (robot cajas $?cajas maximo 3 actual ?actual palet pedidos pedidosLinea $?ini caja ?tipoCaja ?numeroCajas $?fin linea $?resto)
    (test (<= (+ ?actual ?numeroCajas) 3))
    =>
    (assert (robot cajas ?tipoCaja ?numeroCajas maximo 3 actual (+ ?actual ?numeroCajas) palet pedidos pedidosLinea $?ini $?fin linea $?resto))
)

(defrule mover-robot-naranjas
    (robot cajas naranjas ?cuantas maximo 3 actual ?actual palet ?paletActual $?resto)
    =>
    (assert(robot cajas naranjas ?cuantas  maximo 3 actual ?actual palet naranjas $?resto))
)
(defrule dejar-caja-naranjas
    (robot cajas naranjas ?cuantas maximo 3 actual ?actual palet naranjas pedidosLinea $?pedidos linea $?ini naranjas $?fin)
    =>
    (assert (robot cajas maximo 3 actual (- ?actual ?cuantas) palet naranjas pedidosLinea $?pedidos linea $?ini naranjas ?cuantas $?fin))
)

(defrule mover-robot-manzanas
    (robot cajas manzanas ?cuantas maximo 3 actual ?actual palet ?paletActual $?resto)
    =>
    (assert(robot cajas manzanas ?cuantas maximo 3 actual ?actual palet manzanas $?resto))
)
(defrule dejar-caja-manzanas
    (robot cajas manzanas ?cuantas maximo 3 actual ?actual palet manzanas pedidosLinea $?pedidos linea $?ini manzanas $?fin)
    =>
    (assert (robot cajas maximo 3 actual (- ?actual ?cuantas) palet manzanas pedidosLinea $?pedidos linea $?ini manzanas ?cuantas $?fin))
)

(defrule mover-robot-uvas
    (robot cajas uvas ?cuantas maximo 3 actual ?actual palet ?paletActual $?resto)
    =>
    (assert(robot cajas uvas ?cuantas maximo 3 actual ?actual palet uvas $?resto))
)
(defrule dejar-caja-uvas
    (robot cajas uvas ?cuantas maximo 3 actual ?actual palet uvas pedidosLinea $?pedidos linea $?ini uvas $?fin)
    =>
    (assert (robot cajas maximo 3 actual (- ?actual ?cuantas) palet uvas pedidosLinea $?pedidos linea $?ini uvas ?cuantas $?fin))
)

(defrule meta
    (robot cajas maximo 3 actual 0 palet ?paletActual pedidosLinea linea $?cajasOrdenadas)
    => 
    (halt)
)