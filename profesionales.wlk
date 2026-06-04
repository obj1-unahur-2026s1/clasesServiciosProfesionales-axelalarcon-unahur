class Vinculado {
    const universidad

    method honorarios() = universidad.honorarios()
    method provinciasDeTrabajo() = [universidad.provincia()]
    method universidad() = universidad
}

class Asociado {
    const universidad

    method honorarios() = 3000
    method provinciasDeTrabajo() = [new Provincia(nombre="entre rios"), 
                                    new Provincia(nombre="santa fe"), 
                                    new Provincia(nombre="corrientes")
                                ]
    method universidad() = universidad
}

class Libre {
    const provincias = []
    const universidad
    var honorarios

    method honorarios() = honorarios
    method provinciasDeTrabajo() = provincias
    method universidad() = universidad

    method cambiarHonorarios(cantidad) {
        honorarios = cantidad
    }

    method agregarProvincia(provincia) {
        provincias.add(provincia)
    }

    method quitarProvincia(provincia) {
        provincias.remove(provincia)
    }

}

class Provincia {
    const nombre
    method nombre() = nombre
}