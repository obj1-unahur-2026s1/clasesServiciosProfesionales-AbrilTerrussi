
class Universidad{
    var property provinciaDeOrigen
    var property honorariosPorHoraRecomendados
}

class ProfesionalVinculadoAUniversidad {
    var property universidad 
    
    method provinciaEnQuePuedeTrabajar(){
        return #{universidad.provinciaDeOrigen()}
    }

    method honorariosRecomendados(){
        return universidad.honorariosPorHoraRecomendados()
    }


}

class ProfesionalAsociadosDelLitoral{
    var property universidad

    method provinciaEnQuePuedeTrabajar(){
        return #{"Entre Rios","Santa Fe","Corrientes"}
    }

    method honorariosRecomendados() = 3000

}

class ProfesionalLibre{
    var property universidad 
    var property provinciaEnQuePuedeTrabajar
    const honorariosRecomendados

    method honorariosRecomendados() = honorariosRecomendados
}

class EmpresaDeServicio{
    const profesionalesContratados = []
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

}