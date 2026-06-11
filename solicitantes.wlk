class Persona {
    const provincia

    method puedeSerAtendida(profesional) = profesional.provinciasDeTrabajo().contains(provincia)
}

class Institucion {
    const universidades

    method puedeSerAtendida(profesional) = universidades.contains(profesional.provincia())
}

class Club {
    const provincias

    method puedeSerAtendida(profesional) = provincias.any({p => profesional.provinciasDeTrabajo().contains(p)})
}