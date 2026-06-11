object empresa {
    const profesionales = []
    const clientes = []
    var honorario = 3500

    method profesionalesDeUniversidad(universidad) = profesionales.filter({p => p.universidad() == universidad}).size()
    method profesionalesCaros() = profesionales.filter({p => p.honorarios() > honorario}).asSet()
    method universidadesFormadoras() = profesionales.map({p => p.universidad()}).asSet()
    method profesionalMasBarato() = profesionales.min({p => p.honorarios()})
    method esDeGenteAcotada() = profesionales.all({p => p.provinciasDeTrabajo().size() <= 3})
    method puedeSatisfacer(solicitante) = profesionales.any({p => solicitante.puedeSerAtendida(p)})
    method profesionalParaSolicitante(solicitante) = profesionales.find({p => solicitante.puedeSerAtendida(p)})
    method cantidadClientes() = clientes.size()
    method tieneACliente(solicitante) = clientes.contains(solicitante)

    method esPocoAtracivo(profesional) = profesional.provinciasDeTrabajo().all({p => self.esProvinciaCubierta(p, profesional.honorarios())})
    method esProvinciaCubierta(provincia, monto) = profesionales.any({p => p.trabajaEnProvincia(provincia) and p.honorarios() < monto})

    method cambiarHonorario(monto) {
        honorario = monto
    }

    method contratarProfesional(profesional) {
        profesionales.add(profesional)
    } 

    method despedirProfesional(profesional) {
        profesionales.remove(profesional)
    }

    method darServicio(solicitante) {
        if (self.puedeSatisfacer(solicitante)) {
            const profesional = self.profesionalParaSolicitante(solicitante)
            profesional.cobrar(profesional.honorarios())
            clientes.add(solicitante)
        }
    }

}