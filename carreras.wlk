import materias.*

class Carrera {
  const property materiasDeLaCarrera = #{}
}

const materiasProgram = #{
  elemDeProgramacion,
  matematica1,
  objetos1,
  objetos2,
  objetos3,
  trabajoFinal,
  basesDeDatos,
  programacionConcurrente
}

const materiasMedicina = #{quimica, biologia1, biologia2, anatomiaGeneral}

const materiasDerecho = #{
  latin,
  derechoRomano,
  historiaDerechoArg,
  derechoPenal1,
  derechoPenal2
}

const programacion = new Carrera(materiasDeLaCarrera = materiasProgram)

const derecho = new Carrera(materiasDeLaCarrera = materiasDerecho)

const medicina = new Carrera(materiasDeLaCarrera = materiasMedicina)