//solicitantes
class Persona{
    var provinciaDondeVive

    method cambiarProvincia(unaProvincia){
        provinciaDondeVive = unaProvincia
    }

    method puedeSerAtendidoPor(unProfesional){
        return unProfesional.provinciaEnQuePuedeTrabajar().contains(provinciaDondeVive)
    }

    method provinciaDondeVive() = provinciaDondeVive

}

class Institucion{
    const universidadesReconocidas = []

    method agregarInst(unaInst){
        universidadesReconocidas.add(unaInst)
    }

    method quitarInst(unaInst){
        universidadesReconocidas.remove(unaInst)
    }

    method puedeSerAtendidoPor(unProfesional){
        return universidadesReconocidas.contains(unProfesional.universidad())
    }

}

class Club{
    const provinciasDondeEsta = #{}

    method agregarInst(unaInst){
        provinciasDondeEsta.add(unaInst)
    }

    method quitarProv(unaProv){
        provinciasDondeEsta.remove(unaProv)
    }

    method estaEnProvincia(unaProvincia){
        return provinciasDondeEsta.contains(unaProvincia)
    }

    method puedeSerAtendidoPor(unProfesional){
        return 
        provinciasDondeEsta.any({p=> unProfesional.provinciaEnQuePuedeTrabajar().contains(p)})
    }

}