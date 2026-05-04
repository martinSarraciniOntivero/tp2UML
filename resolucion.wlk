class Empresa{
    const empleados 
    var property  nombre 
    var property cuit 
    var recibosDeHaberes 
    method recibosDeHaberes(){
        return recibosDeHaberes
    }
    method liquidacionDeSueldos(){
        self.pagarSueldos()
        self.generarRecibosdeHaberes()
    }
    method pagarSueldos(){
        empleados.forEach({empleado => empleado.cobrar(empleado.sueldoNeto())})
    }
    method generarRecibosdeHaberes(){
      recibosDeHaberes += self.liquidacionEnRecibos()
      
    }
    method montoTotalSueldosNeto(){
        return empleados.sum({empleado => empleado.sueldoNeto()})
    }
    method montoTotalSueldosBruto(){
        return empleados.sum({empleado => empleado.sueldoBruto()})
    }
    method montoTotalRetenciones(){
        return empleados.sum({empleado => empleado.retenciones()})
    }
    method liquidacionEnRecibos(){
        return empleados.map({empleado => new ReciboDeHaberes(
            nombreEmpleado = empleado.nombre(),
            sueldoBruto = empleado.sueldoBruto(),
            direccion = empleado.direccion(),
            sueldoNeto = empleado.sueldoNeto(),
            fechaEmision = new Date(),
            informacion = empleado.desglosarInformacion()
        )})
    }

}

class ReciboDeHaberes{
    var property nombreEmpleado
    var property sueldoBruto
    var property direccion
    var property fechaEmision  
    var property sueldoNeto
    var property informacion  

}

class Empleado{
    var property  nombre 
    var property direccion
    var property sueldoBasico 
    var property estadoCivil 
    var property fechaNac
    var property salario  
    const hoy = new Date()
    method cobrar(monto){
        salario += monto
    }
    method edad(){
        return hoy.year() - fechaNac.year() + self.losMesesCumplidos()  
    }
    method losMesesCumplidos(){
        if( self.pasoElMes() || self.pasoElDia() ){
            return 1
        }
        else{
            return 0
        }
    }
    method pasoElMes(){
        return hoy.month() > fechaNac.month()
    }
    method pasoElDia(){
        return hoy.month() == fechaNac.month() && hoy.day() >= fechaNac.day()
    }

    method sueldoBruto(){
        return sueldoBasico + self.comisionExtra()
    }
    method comisionExtra()
    
    method retenciones(){
        return self.obraSocial() + self.aportesJubilatorios()
    }
    method obraSocial()
    method aportesJubilatorios()
    method sueldoNeto(){
        return self.sueldoBruto() - self.retenciones()
    }
    method desglosarInformacion()

}

class Permanente inherits Empleado{
    var property cantHijos
    var property antiguedad 
    override method desglosarInformacion(){
        return "cobra un sueldo bruto de "+self.sueldoBruto()+" por su sueldo basico de "+sueldoBasico+" y una comision extra de "+self.comisionExtra()+
        " por tener "+cantHijos+" hijos que suma 150 c/u, "+antiguedad+" años de antiguedad que suma 50 por cada año y un estado civil "+estadoCivil+"
         que suma 100 si es casado o 0 si es soltero. 
         se le retiene "+self.retenciones()+" por: 10% obra social mas 20 por cada hijo y 15% aportes jubilatorios, quedando un sueldo neto de "+self.sueldoNeto()
    }
    override method comisionExtra(){
        return self.aPorHijo() + self.aPorAntiguedad() + self.aPorEstadoCivil()
    }
    method aPorHijo(){
        return cantHijos * 150
    }
    method aPorAntiguedad(){
        return antiguedad * 50
    }
    method aPorEstadoCivil(){
        if(estadoCivil){
            return 100
        }
        else{
            return 0
        }
    }
    override method obraSocial(){
        return (self.sueldoBruto() * 0.1) + self.porCadaHijo()
    }
    method porCadaHijo(){
        return cantHijos * 20
    }
    override method aportesJubilatorios(){
        return (self.sueldoBruto() * 0.15) 
    }
    

}

class Temporario inherits Empleado{
    var property horasExtra 
    var property fechaDesign   
        override method desglosarInformacion(){
            return "cobra un sueldo bruto de "+self.sueldoBruto()+" por su sueldo basico de "+sueldoBasico+" y una comision extra de "+self.comisionExtra()+
            " por tener "+horasExtra+" horas extra que suma 40 c/u. Se le retiene "+self.retenciones()+" por: 10% obra social mas 5 por cada hora extra y 10% aportes jubilatorios, quedando un sueldo neto de "+self.sueldoNeto()
        }
    override method comisionExtra(){
            return self.aPorHoraExtra()
        }
    method aPorHoraExtra(){
        return horasExtra * 40
    }
    override method obraSocial(){
        return (self.sueldoBruto() * 0.1) + self.siSupera50años()
    }
    method siSupera50años(){
        if(self.edad() > 50){
            return 25
        }else{
            return 0
        }
    }
    override method aportesJubilatorios(){
        return (self.sueldoBruto() * 0.1) + self.retenPorHorasExtra() 
    }
    method retenPorHorasExtra(){
        return horasExtra * 5
    }
}

class Contratado inherits Empleado{
    var property nroContrato 
    var property medioDePago 
    override method comisionExtra(){
        return 0
    }
    override method retenciones(){
        return 50
    }  
    override method desglosarInformacion(){
        return "cobra un sueldo bruto de "+self.sueldoBruto()+" por su sueldo basico de "+sueldoBasico+". Se le retiene un monto fijo de 50, quedando un sueldo neto de "+self.sueldoNeto()
    }
    override method obraSocial(){
        return 0
    }
    override method aportesJubilatorios(){
        return 0
    }
}
