class ProfesionalVinculadoAUniversidad {
    var property universidad 
    
    method provinciaEnQuePuedeTrabajar(){
        return #{universidad.provinciaDeOrigen()}
    }

    method honorariosRecomendados(){
        return universidad.honorariosPorHoraRecomendados()
    }

    method cobrarImporte(unImporte){
        universidad.recibirDonacion(unImporte/2)
    }

}

class ProfesionalAsociadosDelLitoral{
    var property universidad

    method provinciaEnQuePuedeTrabajar(){
        return #{"Entre Rios","Santa Fe","Corrientes"}
    }

    method honorariosRecomendados() = 3000

    method cobrarImporte(unImporte){
        asociacionDeProfDelLitoral.recibirDonacion(unImporte)

    }

}

object asociacionDeProfDelLitoral{
    var totalRecaudado = 0

    method recibirDonacion(unImporte){
        totalRecaudado = totalRecaudado + unImporte
    }
}  

class ProfesionalLibre{
    var property universidad 
    var property provinciaEnQuePuedeTrabajar
    const honorariosRecomendados
    var totalRecaudado = 0

    method totalRecaudado() = totalRecaudado

    method honorariosRecomendados() = honorariosRecomendados

    method cobrarImporte(unImporte){
        totalRecaudado = totalRecaudado + unImporte
    }

    method pasarDineroA(profesionalLibre, unImporte){
        profesionalLibre.totalRecaudado() + unImporte
    }
}//prubeagit