import aprobadas.*
import materias.*
import carreras.*
import estudiantes.*

object sistemaInscripciones {
  method verificarAprobada(alumno, materia) {
    if (self.yaAproboLaMateria(alumno, materia)) self.error(
        "ERROR: Este alumno ya tiene esa materia aprobada"
      )
  }
  
  method registrarAprobada(alumno, materia, nota) {
    self.verificarAprobada(alumno, materia)
    
    const materiaAprobada = new DatosDeMateriaAprobada(
      materiaAprobada = materia,
      notaFinal = nota
    )
    alumno.agregarMateriaAprobada(materiaAprobada)
  }
  
  method yaAproboLaMateria(alumno, materia) = alumno.materiasAprobadas().any(
    { aprobada => aprobada.queMateria(materia)}
  )
  
  method promedio(alumno) {
    if (alumno.materiasAprobadas().isEmpty()) {
      return 0
    } else {
      return alumno.materiasAprobadas().average({ mat => mat.notaFinal() })
    }
  }
  
  method materiasDeTodasLasCarreras(alumno) = alumno.carreras().fold(
    #{},
    { acum, each => each.materiasDeLaCarrera().union(acum) }
  )
  
  method puedeInscribirseA(alumno, materia) = ((self.materiasDeTodasLasCarreras(
    alumno
  ).contains(materia) && (not self.yaAproboLaMateria(
    alumno,
    materia
  ))) && (not materia.estaInscriptoEsteAlumno(
    alumno
  ))) && alumno.cumpleLosRequisitosParaCursar(materia)
  
  method verificarInscripcion(alumno, materia) {
    if (!self.puedeInscribirseA(alumno, materia)) self.error(
        "ERROR: Este alumno no se puede inscribir a esta materia"
      )
  }
  
  method inscribirAlumnoAUnaMateria(alumno, materia) {
    self.verificarInscripcion(alumno, materia)
    
    materia.inscribirAlumno(alumno)
  }
  
  method darDeBajaEnMateria(alumno, materia) {
    materia.darAlumnoDeBaja(alumno)
    materia.darLugarAlPrimeroEnEspera()
  }
  
  method materiasEnLasQueElAlumnoEstaInscripto(
    alumno
  ) = self.materiasDeTodasLasCarreras(alumno).filter(
    { materia => materia.estaInscriptoALaMateria(alumno) }
  )
  
  method materiasQueElAlumnoEstaEsperando(
    alumno
  ) = self.materiasDeTodasLasCarreras(alumno).filter(
    { materia => materia.estaEnLaListaDeEspera(alumno) }
  )
  
  method materiasDeLaCarreraDisponiblesAlAlumno(
    carrera,
    alumno
  ) = carrera.materiasDeLaCarrera().filter(
    { materia => alumno.cumpleLosRequisitosParaCursar(materia) }
  )
}