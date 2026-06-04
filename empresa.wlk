object empresa {
    const profesionales = []
    var honorario = 3500

    method profesionalesDeUniversidad(universidad) = profesionales.filter({p => p.universidad() == universidad}).size()
    method profesionalesCaros() = profesionales.filter({p => p.honorarios() > honorario}).asSet()
    method universidadesFormadoras() = profesionales.map({p => p.universidad()}).asSet()
    method profesionalMasBarato() = profesionales.min({p => p.honorarios()})
    method esDeGenteAcotada() = profesionales.all({p => p.provinciasDeTrabajo().size() <= 3})

    method cambiarHonorario(monto) {
        honorario = monto
    }

    method contratarProfesional(profesional) {
        profesionales.add(profesional)
    } 

    method despedirProfesional(profesional) {
        profesionales.remove(profesional)
    }
}