class Universidad {
    const provincia
    const honorarios
    var totalDonado = 0

    method provincia() = provincia
    method honorarios() = honorarios

    method recibirDonacion(importe) {
        totalDonado += importe
    }
}