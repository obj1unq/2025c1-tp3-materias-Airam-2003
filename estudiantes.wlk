import materias.*

class Estudiante {
  const property carreras = #{}
  const property materiasAprobadas = #{}

  method agregarMateriaAprobada(aprobada) {
    materiasAprobadas.add(aprobada)
  }

  method yaAproboLaMateria(materia) {
    materiasAprobadas.any({aprobada => aprobada.queMateria(materia)})
  }

  method nombresDeMateriasAprobadas() {
    return materiasAprobadas.map({aprobada => aprobada.materiaAprobada()})
  }

  method cumpleLosRequisitosParaCursar(
    materia
) = materia.requisitos().intersection(
    self.nombresDeMateriasAprobadas()
  ) == materia.requisitos()
}