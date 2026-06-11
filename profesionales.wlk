class Vinculado {
    const universidad

    method honorarios() = universidad.honorarios()
    method provinciasDeTrabajo() = [universidad.provincia()]
    method universidad() = universidad
    method trabajaEnProvincia(provincia) = self.provinciasDeTrabajo().contains(provincia)

    method cobrar(importe) {
        universidad.recibirDonacion(importe / 2)
    }
}

class Asociado {
    const universidad

    method honorarios() = 3000
    method provinciasDeTrabajo() = [new Provincia(nombre="entre rios"), 
                                    new Provincia(nombre="santa fe"), 
                                    new Provincia(nombre="corrientes")
                                ]
    method universidad() = universidad
    method trabajaEnProvincia(provincia) = self.provinciasDeTrabajo().contains(provincia)

    method cobrar(importe) {
        asociacionProfesionalesLitoral.recibirDonacion(importe)
    }
}

class Libre {
    const provincias = []
    const universidad
    var honorarios
    var totalRecaudado = 0

    method honorarios() = honorarios
    method provinciasDeTrabajo() = provincias
    method universidad() = universidad
    method trabajaEnProvincia(provincia) = provincias.contains(provincia)

    method cambiarHonorarios(cantidad) {
        honorarios = cantidad
    }

    method agregarProvincia(provincia) {
        provincias.add(provincia)
    }

    method quitarProvincia(provincia) {
        provincias.remove(provincia)
    }

    method cobrar(importe) {
        totalRecaudado += importe
    }

    method pasarDinero(profesional, importe) {
        profesional.cobrar(importe)
        totalRecaudado -= importe
    }
}

class Provincia {
    const nombre
    method nombre() = nombre
}

object asociacionProfesionalesLitoral {
    var totalRecaudado = 0

    method recibirDonacion(importe) {
        totalRecaudado += importe
    }
}