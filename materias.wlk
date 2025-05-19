class Materia {
  const property requisitos = #{}
  const property cupo = 3
  var property alumnosInscriptos = #{}
  var property listaDeEspera = []
  
  method estanTodosLosCuposLlenos() = alumnosInscriptos.size() == cupo
  
  method inscribirAlumno(alumno) {
    if (self.estanTodosLosCuposLlenos()) listaDeEspera.add(alumno)
    else alumnosInscriptos.add(alumno)
  }
  
  method estaInscriptoEsteAlumno(alumno) = alumnosInscriptos.contains(alumno)
  
  method estaEnLaListaDeEspera(alumno) = listaDeEspera.contains(alumno)
  
  method verificarBaja(alumno) {
    if (!self.estaInscriptoEsteAlumno(alumno)) self.error(
        "ERROR: Este alumno no esta inscripto en esta materia"
      )
  }
  
  method darAlumnoDeBaja(alumno) {
    self.verificarBaja(alumno)
    
    alumnosInscriptos.remove(alumno)
  }
  
  method alumnoPrioritario() = listaDeEspera.head()
  
  method darLugarAlPrimeroEnEspera() {
    self.inscribirAlumno(self.alumnoPrioritario())
    listaDeEspera.remove(self.alumnoPrioritario())
  }
}

const elemDeProgramacion = new Materia()

const matematica1 = new Materia()

const objetos1 = new Materia()

const objetos2 = new Materia(requisitos = #{objetos1, matematica1})

const objetos3 = new Materia(requisitos = #{objetos2, basesDeDatos})

const programacionConcurrente = new Materia(
  requisitos = #{objetos1, basesDeDatos}
)

const trabajoFinal = new Materia()

const basesDeDatos = new Materia()

const quimica = new Materia()

const biologia1 = new Materia()

const biologia2 = new Materia(requisitos = #{biologia1})

const anatomiaGeneral = new Materia()

const latin = new Materia()

const derechoRomano = new Materia()

const historiaDerechoArg = new Materia()

const derechoPenal1 = new Materia()

const derechoPenal2 = new Materia()