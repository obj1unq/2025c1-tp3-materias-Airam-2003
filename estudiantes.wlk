import materias.*

class Estudiante {
  const property carreras = #{}
  const property materiasAprobadas = #{}

  method agregarMateriaAprobada(aprobada) {
    materiasAprobadas.add(aprobada)
  }

  method nombresDeLasAprobadas() {
    return materiasAprobadas.map({aprobada => aprobada.materiaAprobada()})
  }

  method cumpleLosRequisitosParaCursar(
    materia
) = materia.requisitos().intersection(
    self.nombresDeLasAprobadas()
  ) == materia.requisitos()
}