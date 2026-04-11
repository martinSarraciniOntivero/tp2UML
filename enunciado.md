ejercicio 1

Se desea modelar una empresa y los empleados que ésta gestiona según las pautas que se describen a continuación.
La empresa tiene un nombre, un CUIT y un conjunto de empleados, cada uno de los cuales tiene la siguiente información básica:
Nombre
Dirección
Estado Civil
Fecha de Nacimiento Sueldo Básico
Además, cada empleado puede calcular su edad a partir de su fecha de nacimiento.
Los empleados se dividen en dos clasificaciones: pueden ser de planta permanente o temporaria. Los empleados de planta permanente tienen, además de la información básica, la siguiente:
Cantidad de Hijos Antigüedad
Los empleados de planta temporaria tienen, además de la información básica, la siguiente:
Fecha de fin de designación a planta temporaria Cantidad de Horas Extras
No obstante la clasificación planteada anteriormente, es política de la empresa manejar a todos los empleados como un conjunto homogéneo sin hacer diferencias entre ambos tipos.
Cada empleado puede calcular su sueldo bruto, las retenciones que se le aplican y el sueldo neto resultante (que se obtiene al restar las dos primeras cantidades). La composición de del sueldo bruto y
de las retenciones dependen del tipo de empleado, como se explica a continuación. El sueldo bruto del empleado de planta permanente se compone de:
Sueldo Básico
Salario Familiar, que se compone de:
Asignación por hijo: $150 por cada hijo.
Asignación por cónyuge: $100 si tiene cónyuge Antigüedad: $50 por cada año de antigüedad.
Las retenciones que se realizan a este empleado son:
Obra Social: 10% de su sueldo bruto + $20 por cada hijo. Aportes Jubilatorios: 15% de su sueldo bruto
Por otro lado, el sueldo bruto del empleado de planta temporaria se compone de:
Sueldo Básico
Horas Extras: $40 por cada hora extra
Las retenciones que se realizan a este empleado son:
Obra Social: 10% de su sueldo bruto + $25 si supera los 50 años Aportes Jubilatorios: 10% de su sueldo bruto + $5 por cada hora extra.
Además, antes de realizar la liquidación de sueldos, se pide a la empresa que calcule las siguientes cantidades:
Monto total que deberá desembolsar en concepto de pago de sueldos a sus empleados (total de sueldos netos). Monto total de sueldos brutos de sus empleados.
Monto total de retenciones de sus empleados.
Finalmente, la empresa realiza la Liquidación de Sueldos. Durante este proceso, por cada empleado se genera y guarda un Recibo de Haberes, el cual contiene la siguiente información:
Nombre del Empleado
Dirección
Fecha de Emisión (del Recibo de Haberes)
Sueldo Bruto
Sueldo Neto
Desgloce de Conceptos: esto es un renglón por cada concepto que aplique en la conformación del sueldo bruto y retenciones aplicadas, siempre informando el monto de cada ítem.
Se pide realizar los siguientes puntos:
a) Realizar un diagrama de clases UML del modelo descripto anteriormente.
b) Implementar en un lenguaje OO que usted conozca el modelo del punto anterior.
c) Muestre en dos scripts de código cómo instancia un escenario concreto en el cual se dispare I) el cálculo del total de sueldos neto y II) la liquidación de sueldo.

ejercicio 2

En base a convenios con universidades y otras instituciones, la empresa decide incorporar un nuevo tipo de empleado, al que denomina “Contratado”.
Cada empleado contratado tiene la siguiente información:
Nombre
Dirección
Estado Civil
Fecha de Nacimiento Sueldo Básico Número de contrato Medio de Pago
El medio de pago es simplemente una descripción de cómo debe pagársele a cada empleado contratado (p.ej: cheque o transferencia bancaria a cuenta personal).
La empresa mantiene su política de manejar a todos los empleados, incluidos los contratados, de forma homogénea sin hacer diferencias entre los tres tipos.
El sueldo bruto de este tipo de empleados es igual a su sueldo básico, pero su sueldo neto varía ya que tienen una retención constante igual a $50 en concepto de “Gastos Administrativos Contractuales”.
Se pide realizar los siguientes puntos:
a) Extender el diagrama UML del Ejercicio 1 para incluir esta extensión.
b) Extender el código del Ejercicio 1 para incluir esta extensión.
c) Para realizar esta extensión del modelo, ¿necesitó modificar la clase Empresa? ¿Por qué?
d) Dada esta extensión del modelo, actualice los scripts de código de instanciación de escenarios para incluir también ahora empleados contratados