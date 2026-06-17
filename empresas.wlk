
class EmpresaDeServicio{
    const profesionalesContratados = []
    const clientes = []
    var property honorarioDeReferencia

    method contratarProfesional(unProfesional){
        profesionalesContratados.add(unProfesional)
    } 


    method cantidadQuestudiaronEnUniversidad(unaUni){
        return profesionalesContratados.count({p=> p.universidad() == unaUni})
    }

    method profesionalesMasCaros(){
        return profesionalesContratados.filter({p=> p.honorariosRecomendados() > honorarioDeReferencia}).asSet()
        
    }

    method universidadesFormadoras(){
        return profesionalesContratados.map({p=> p.universidad()}).asSet()
    }

    method profesionalMasBarato(){
        return profesionalesContratados.min({p=> p.honorariosRecomendados()})
    }

    method esDeGenteAcotada(){
        return !profesionalesContratados.contains({
            p=> self.trabajaEnAlMenos3Provincias(p)
        })
    }

    method trabajaEnAlMenos3Provincias(unProfesional){
        return unProfesional.provinciaEnQuePuedeTrabajar() > 3
    }

    method puedeSatisfafcerASolicitante(unSolicitante){
        return profesionalesContratados.any({p=> unSolicitante.puedeSerAtendidoPor(p)})
    }

    method darServicio(unSolicitante){
        if (self.puedeSatisfafcerASolicitante(unSolicitante)){
            const profesionalACargo = profesionalesContratados.find
                        ({p=> unSolicitante.puedeSerAtendidoPor(p)})//devuelve al profesional
            profesionalACargo.cobrarImporte(profesionalACargo.honorariosRecomendados())//cobra
            clientes.add(unSolicitante)
        }
    }

    method cantidadDeClientes(){
        return clientes.size()
    }

    method tieneAlSolicitante(unSolicitante){
        return clientes.contains(unSolicitante)
    }

    method esPocoAtractivo(unProfesional){
        return unProfesional.provinciaEnQuePuedeTrabajar().all{
            provincia => profesionalesContratados.any{ otroProf =>
                otroProf != unProfesional &&
                otroProf.provinciaEnQuePuedeTrabajar().contains(provincia) &&
                otroProf.honorariosRecomendados() < unProfesional.honorariosRecomendados()
            }
    }
}
}