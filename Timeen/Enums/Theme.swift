//
//  Theme.swift
//  Timeen
//
//  Created by Leonardo on 27/02/24.
//

import SwiftUI

enum Theme: CaseIterable {
    case educacion
    case cocina
    case fiesta
    case oficina
    case ventas
    case parque
    case entrevistaTrabajo
    case salud
    case deporte
    case viajes
    case moda
    case musica
    case cine
    case literatura
    case tecnologia
    case arte
    case historia
    case naturaleza
    case automovilismo
    case juegos
    case ciencia
    case economia
    case politica
    case filosofia
    case psicologia
    case idiomas
    case matematicas
    case fisica
    case quimica
    case biologia
    case geografia
    case astronomia
    case medicina
    case ingenieria
    case arquitectura
    case derecho
    case nutricion
    case gastronomia
    case carpinteria
    case electricidad
    case agricultura
    case mineria
    case pesca
    case construccion
    case manufactura
    case comercio
    case hosteleria
    case servicioCliente
    case seguridad
    case medioAmbiente
    case fotografia
    case videojuegos
    case animacion
    case redesSociales
    case programacion
    case diseñoGrafico
    case arteDigital
    case comercioElectronico
    case robotica
    case realidadVirtual
    case ciberseguridad
    case nanotecnologia
    case biotecnologia
    case psiquiatria
    case pediatria
    case dermatologia
    case cardiologia
    case primerosAuxilios
    case saludMental
    case higiene
    case fitness
    case danza
    case teatro
    case pintura
    case escultura
    case poesia
    case periodismo
    case historiaArte
    case entretenimiento
    case jardineria
    case decoracion
    case negocios
    case sociologia
    case ecologia
    case veterinaria
    case farmacia
    case computacion
    case electronica
    case mecanica
    case manualidades
    case belleza
    case reposteria
    case bebidas
    case hospitalidad
    case turismo
    case novela
    case cuento
    case comic
    case emprendimiento
    case liderazgo
    case trabajoEnEquipo
    case inversiones
    
    var title: String {
        switch self {
            case .educacion: return "Educación"
            case .cocina: return "Cocina"
            case .fiesta: return "Fiesta"
            case .oficina: return "Oficina"
            case .ventas: return "Ventas"
            case .parque: return "Parque"
            case .entrevistaTrabajo: return "Entrevista de Trabajo"
            case .salud: return "Salud"
            case .deporte: return "Deporte"
            case .viajes: return "Viajes"
            case .moda: return "Moda"
            case .musica: return "Música"
            case .cine: return "Cine"
            case .literatura: return "Literatura"
            case .tecnologia: return "Tecnología"
            case .arte: return "Arte"
            case .historia: return "Historia"
            case .naturaleza: return "Naturaleza"
            case .automovilismo: return "Automovilismo"
            case .juegos: return "Juegos"
            case .ciencia: return "Ciencia"
            case .economia: return "Economía"
            case .politica: return "Política"
            case .filosofia: return "Filosofía"
            case .psicologia: return "Psicología"
            case .idiomas: return "Idiomas"
            case .matematicas: return "Matemáticas"
            case .fisica: return "Física"
            case .quimica: return "Química"
            case .biologia: return "Biología"
            case .geografia: return "Geografía"
            case .astronomia: return "Astronomía"
            case .medicina: return "Medicina"
            case .ingenieria: return "Ingeniería"
            case .arquitectura: return "Arquitectura"
            case .derecho: return "Derecho"
            case .nutricion: return "Nutrición"
            case .gastronomia: return "Gastronomía"
            case .carpinteria: return "Carpintería"
            case .electricidad: return "Electricidad"
            case .agricultura: return "Agricultura"
            case .mineria: return "Minería"
            case .pesca: return "Pesca"
            case .construccion: return "Construcción"
            case .manufactura: return "Manufactura"
            case .comercio: return "Comercio"
            case .hosteleria: return "Hostelería"
            case .servicioCliente: return "Servicio al Cliente"
            case .seguridad: return "Seguridad"
            case .medioAmbiente: return "Medio Ambiente"
            case .fotografia: return "Fotografía"
            case .videojuegos: return "Videojuegos"
            case .animacion: return "Animación"
            case .redesSociales: return "Redes Sociales"
            case .programacion: return "Programación"
            case .diseñoGrafico: return "Diseño Gráfico"
            case .arteDigital: return "Arte Digital"
            case .comercioElectronico: return "Comercio Electrónico"
            case .robotica: return "Robótica"
            case .realidadVirtual: return "Realidad Virtual"
            case .ciberseguridad: return "Ciberseguridad"
            case .nanotecnologia: return "Nanotecnología"
            case .biotecnologia: return "Biotecnología"
            case .psiquiatria: return "Psiquiatría"
            case .pediatria: return "Pediatría"
            case .dermatologia: return "Dermatología"
            case .cardiologia: return "Cardiología"
            case .primerosAuxilios: return "Primeros Auxilios"
            case .saludMental: return "Salud Mental"
            case .higiene: return "Higiene"
            case .fitness: return "Fitness"
            case .danza: return "Danza"
            case .teatro: return "Teatro"
            case .pintura: return "Pintura"
            case .escultura: return "Escultura"
            case .poesia: return "Poesía"
            case .periodismo: return "Periodismo"
            case .historiaArte: return "Historia del Arte"
            case .entretenimiento: return "Entretenimiento"
            case .jardineria: return "Jardinería"
            case .decoracion: return "Decoración"
            case .negocios: return "Negocios"
            case .sociologia: return "Sociología"
            case .ecologia: return "Ecología"
            case .veterinaria: return "Veterinaria"
            case .farmacia: return "Farmacia"
            case .computacion: return "Computación"
            case .electronica: return "Electrónica"
            case .mecanica: return "Mecánica"
            case .manualidades: return "Manualidades"
            case .belleza: return "Belleza"
            case .reposteria: return "Repostería"
            case .bebidas: return "Bebidas"
            case .hospitalidad: return "Hospitalidad"
            case .turismo: return "Turismo"
            case .novela: return "Novela"
            case .cuento: return "Cuento"
            case .comic: return "Cómic"
            case .emprendimiento: return "Emprendimiento"
            case .liderazgo: return "Liderazgo"
            case .trabajoEnEquipo: return "Trabajo en Equipo"
            case .inversiones: return "Inversiones"
        }
    }
    
    var toRecordValue: Int {
        switch self {
            case .educacion: return 1
            case .cocina: return 2
            case .fiesta: return 3
            case .oficina: return 4
            case .ventas: return 5
            case .parque: return 6
            case .entrevistaTrabajo: return 7
            case .salud: return 8
            case .deporte: return 9
            case .viajes: return 10
            case .moda: return 11
            case .musica: return 12
            case .cine: return 13
            case .literatura: return 14
            case .tecnologia: return 15
            case .arte: return 16
            case .historia: return 17
            case .naturaleza: return 18
            case .automovilismo: return 19
            case .juegos: return 20
            case .ciencia: return 21
            case .economia: return 22
            case .politica: return 23
            case .filosofia: return 24
            case .psicologia: return 25
            case .idiomas: return 26
            case .matematicas: return 27
            case .fisica: return 28
            case .quimica: return 29
            case .biologia: return 30
            case .geografia: return 31
            case .astronomia: return 32
            case .medicina: return 33
            case .ingenieria: return 34
            case .arquitectura: return 35
            case .derecho: return 36
            case .nutricion: return 37
            case .gastronomia: return 38
            case .carpinteria: return 39
            case .electricidad: return 40
            case .agricultura: return 41
            case .mineria: return 42
            case .pesca: return 43
            case .construccion: return 44
            case .manufactura: return 45
            case .comercio: return 46
            case .hosteleria: return 47
            case .servicioCliente: return 48
            case .seguridad: return 49
            case .medioAmbiente: return 50
            case .fotografia: return 51
            case .videojuegos: return 52
            case .animacion: return 53
            case .redesSociales: return 54
            case .programacion: return 55
            case .diseñoGrafico: return 56
            case .arteDigital: return 57
            case .comercioElectronico: return 58
            case .robotica: return 59
            case .realidadVirtual: return 60
            case .ciberseguridad: return 61
            case .nanotecnologia: return 62
            case .biotecnologia: return 63
            case .psiquiatria: return 64
            case .pediatria: return 65
            case .dermatologia: return 66
            case .cardiologia: return 67
            case .primerosAuxilios: return 68
            case .saludMental: return 69
            case .higiene: return 70
            case .fitness: return 71
            case .danza: return 72
            case .teatro: return 73
            case .pintura: return 74
            case .escultura: return 75
            case .poesia: return 76
            case .periodismo: return 77
            case .historiaArte: return 78
            case .entretenimiento: return 79
            case .jardineria: return 80
            case .decoracion: return 81
            case .negocios: return 82
            case .sociologia: return 83
            case .ecologia: return 84
            case .veterinaria: return 85
            case .farmacia: return 86
            case .computacion: return 87
            case .electronica: return 88
            case .mecanica: return 89
            case .manualidades: return 90
            case .belleza: return 91
            case .reposteria: return 92
            case .bebidas: return 93
            case .hospitalidad: return 94
            case .turismo: return 95
            case .novela: return 96
            case .cuento: return 97
            case .comic: return 98
            case .emprendimiento: return 99
            case .liderazgo: return 100
            case .trabajoEnEquipo: return 101
            case .inversiones: return 102
        }
    }
    
    var value: Int {
        switch self {
            case .educacion: return 60
            case .entretenimiento: return 50
            case .salud: return 55
            case .tecnologia: return 45
            case .viajes: return 30
            case .cocina: return 35
            case .moda: return 25
            case .musica: return 20
            case .jardineria: return 15
            case .decoracion: return 10
            case .arte: return 22
            case .literatura: return 18
            case .ciencia: return 28
            case .historia: return 12
            case .politica: return 16
            case .negocios: return 50
            case .matematicas: return 34
            case .psicologia: return 48
            case .sociologia: return 46
            case .filosofia: return 44
            case .idiomas: return 52
            case .biologia: return 36
            case .quimica: return 32
            case .fisica: return 30
            case .ecologia: return 28
            case .astronomia: return 26
            case .medicina: return 54
            case .veterinaria: return 22
            case .farmacia: return 18
            case .ingenieria: return 56
            case .arquitectura: return 58
            case .computacion: return 46
            case .robotica: return 24
            case .electronica: return 26
            case .electricidad: return 28
            case .mecanica: return 30
            case .construccion: return 32
            case .manualidades: return 14
            case .belleza: return 16
            case .nutricion: return 18
            case .gastronomia: return 20
            case .reposteria: return 22
            case .bebidas: return 24
            case .hospitalidad: return 26
            case .turismo: return 28
            case .cine: return 23
            case .teatro: return 21
            case .danza: return 19
            case .pintura: return 17
            case .escultura: return 15
            case .fotografia: return 13
            case .poesia: return 11
            case .novela: return 9
            case .cuento: return 7
            case .periodismo: return 6
            case .comic: return 8
            case .videojuegos: return 14
            case .realidadVirtual: return 16
            case .ciberseguridad: return 24
            case .programacion: return 26
            case .redesSociales: return 34
            case .emprendimiento: return 42
            case .liderazgo: return 44
            case .trabajoEnEquipo: return 46
            case .inversiones: return 52
            case .economia: return 54
            case .fiesta: return 35
            case .oficina: return 33
            case .ventas: return 31
            case .parque: return 29
            case .entrevistaTrabajo: return 27
            case .deporte: return 25
            case .naturaleza: return 23
            case .automovilismo: return 21
            case .juegos: return 19
            case .geografia: return 15
            case .derecho: return 13
            case .carpinteria: return 11
            case .agricultura: return 9
            case .mineria: return 5
            case .pesca: return 3
            case .manufactura: return 37
            case .comercio: return 39
            case .hosteleria: return 41
            case .servicioCliente: return 43
            case .seguridad: return 45
            case .medioAmbiente: return 47
            case .animacion: return 51
            case .diseñoGrafico: return 57
            case .arteDigital: return 59
            case .comercioElectronico: return 60
            case .nanotecnologia: return 48
            case .biotecnologia: return 46
            case .psiquiatria: return 42
            case .pediatria: return 40
            case .dermatologia: return 36
            case .cardiologia: return 34
            case .primerosAuxilios: return 30
            case .saludMental: return 28
            case .higiene: return 26
            case .fitness: return 24
            case .historiaArte: return 16
        }
    }
    
    
    
    var color: Color {
        switch self {
            case .educacion: return Color.blue
            case .cocina: return Color.red
            case .fiesta: return Color.purple
            case .oficina: return Color.gray
            case .ventas: return Color.green
            case .parque: return Color.brown
            case .entrevistaTrabajo: return Color.black
            case .salud: return Color.pink
            case .deporte: return Color.orange
            case .viajes: return Color.teal
            case .moda: return Color.yellow
            case .musica: return Color.indigo
            case .cine: return Color.cyan
            case .literatura: return Color.purple
            case .tecnologia: return Color.blue
            case .arte: return Color.purple
            case .historia: return Color.brown
            case .naturaleza: return Color.green
            case .automovilismo: return Color.gray
            case .juegos: return Color.red
            case .ciencia: return Color.blue
            case .economia: return Color.green
            case .politica: return Color.red
            case .filosofia: return Color.yellow
            case .psicologia: return Color.pink
            case .idiomas: return Color.orange
            case .matematicas: return Color.blue
            case .fisica: return Color.gray
            case .quimica: return Color.green
            case .biologia: return Color.green
            case .geografia: return Color.brown
            case .astronomia: return Color.indigo
            case .medicina: return Color.red
            case .ingenieria: return Color.orange
            case .arquitectura: return Color.brown
            case .derecho: return Color.black
            case .nutricion: return Color.green
            case .gastronomia: return Color.red
            case .carpinteria: return Color.brown
            case .electricidad: return Color.yellow
            case .agricultura: return Color.green
            case .mineria: return Color.gray
            case .pesca: return Color.blue
            case .construccion: return Color.orange
            case .manufactura: return Color.gray
            case .comercio: return Color.green
            case .hosteleria: return Color.purple
            case .servicioCliente: return Color.pink
            case .seguridad: return Color.black
            case .medioAmbiente: return Color.green
            case .fotografia: return Color.cyan
            case .videojuegos: return Color.purple
            case .animacion: return Color.orange
            case .redesSociales: return Color.blue
            case .programacion: return Color.gray
            case .diseñoGrafico: return Color.purple
            case .arteDigital: return Color.indigo
            case .comercioElectronico: return Color.green
            case .robotica: return Color.gray
            case .realidadVirtual: return Color.purple
            case .ciberseguridad: return Color.red
            case .nanotecnologia: return Color.orange
            case .biotecnologia: return Color.green
            case .psiquiatria: return Color.purple
            case .pediatria: return Color.pink
            case .dermatologia: return Color.red
            case .cardiologia: return Color.red
            case .primerosAuxilios: return Color.orange
            case .saludMental: return Color.purple
            case .higiene: return Color.green
            case .fitness: return Color.orange
            case .danza: return Color.purple
            case .teatro: return Color.red
            case .pintura:return Color.yellow
            case .escultura: return Color.brown
            case .poesia: return Color.cyan
            case .periodismo: return Color.blue
            case .historiaArte: return Color.brown
            case .entretenimiento: return Color.purple
            case .jardineria: return Color.green
            case .decoracion: return Color.yellow
            case .negocios: return Color.blue
            case .sociologia: return Color.red
            case .ecologia: return Color.green
            case .veterinaria: return Color.purple
            case .farmacia: return Color.blue
            case .computacion: return Color.gray
            case .electronica: return Color.orange
            case .mecanica: return Color.gray
            case .manualidades: return Color.yellow
            case .belleza: return Color.pink
            case .reposteria: return Color.red
            case .bebidas: return Color.blue
            case .hospitalidad: return Color.purple
            case .turismo: return Color.teal
            case .novela: return Color.purple
            case .cuento: return Color.cyan
            case .comic: return Color.red
            case .emprendimiento: return Color.orange
            case .liderazgo: return Color.blue
            case .trabajoEnEquipo: return Color.green
            case .inversiones: return Color.yellow
        }
    }
    
    var icon: String {
        switch self {
            case .educacion: return "book"
            case .cocina: return "fork.knife"
            case .fiesta: return "sparkles"
            case .oficina: return "briefcase"
            case .ventas: return "tag"
            case .parque: return "tree"
            case .entrevistaTrabajo: return "person.2"
            case .salud: return "cross.fill"
            case .deporte: return "football.fill"
            case .viajes: return "airplane"
            case .moda: return "tshirt"
            case .musica: return "music.note"
            case .cine: return "film"
            case .literatura: return "books.vertical"
            case .tecnologia: return "desktopcomputer"
            case .arte: return "paintpalette"
            case .historia: return "scroll"
            case .naturaleza: return "camera.macro"
            case .automovilismo: return "car"
            case .juegos: return "gamecontroller"
            case .ciencia: return "atom"
            case .economia: return "chart.bar"
            case .politica: return "building.columns"
            case .filosofia: return "lightbulb"
            case .psicologia: return "brain.head.profile"
            case .idiomas: return "globe"
            case .matematicas: return "function"
            case .fisica: return "scalemass"
            case .quimica: return "flask"
            case .biologia: return "lizard.fill"
            case .geografia: return "map"
            case .astronomia: return "star"
            case .medicina: return "bandage.fill"
            case .ingenieria: return "gearshape.2.fill"
            case .arquitectura: return "building.2"
            case .derecho: return "scalemass"
            case .nutricion: return "carrot"
            case .gastronomia: return "fork.knife"
            case .carpinteria: return "hammer"
            case .electricidad: return "bolt"
            case .agricultura: return "leaf"
            case .mineria: return "diamond.fill"
            case .pesca: return "fish"
            case .construccion: return "hammer.fill"
            case .manufactura: return "wrench.and.screwdriver.fill"
            case .comercio: return "cart"
            case .hosteleria: return "bed.double.fill"
            case .servicioCliente: return "person.2.fill"
            case .seguridad: return "web.camera.fill"
            case .medioAmbiente: return "leaf.fill"
            case .fotografia: return "camera"
            case .videojuegos: return "gamecontroller.fill"
            case .animacion: return "film.fill"
            case .redesSociales: return "person.3.fill"
            case .programacion: return "curlybraces"
            case .diseñoGrafico: return "paintbrush.pointed.fill"
            case .arteDigital: return "pencil.tip.crop.circle"
            case .comercioElectronico: return "cart.fill"
            case .robotica: return "gearshape.fill"
            case .realidadVirtual: return "goggles"
            case .ciberseguridad: return "lock.shield"
            case .nanotecnologia: return "circle.grid.cross"
            case .biotecnologia: return "leaf.arrow.circlepath"
            case .psiquiatria: return "brain.head.profile"
            case .pediatria: return "stethoscope"
            case .dermatologia: return "face.smiling"
            case .cardiologia: return "heart.fill"
            case .primerosAuxilios: return "cross.case"
            case .saludMental: return "figure.wave"
            case .higiene: return "bubble.left.and.bubble.right.fill"
            case .fitness: return "figure.walk"
            case .danza: return "figure.socialdance"
            case .teatro: return "theatermasks.fill"
            case .pintura: return "paintpalette.fill"
            case .escultura: return "hammer.fill"
            case .poesia: return "book.closed.fill"
            case .periodismo: return "newspaper.fill"
            case .historiaArte: return "photo.artframe"
            case .entretenimiento: return "film"
            case .jardineria: return "camera.macro"
            case .decoracion: return "paintbrush.fill"
            case .negocios: return "briefcase.fill"
            case .sociologia: return "person.3.sequence.fill"
            case .ecologia: return "globe.americas.fill"
            case .veterinaria: return "pawprint.fill"
            case .farmacia: return "pills.fill"
            case .computacion: return "cpu"
            case .electronica: return "sparkles.tv.fill"
            case .mecanica: return "gearshape.2.fill"
            case .manualidades: return "scissors"
            case .belleza: return "comb.fill"
            case .reposteria: return "cup.and.saucer.fill"
            case .bebidas: return "waterbottle"
            case .hospitalidad: return "house.fill"
            case .turismo: return "airplane"
            case .novela: return "book.fill"
            case .cuento: return "books.vertical.fill"
            case .comic: return "bubble.left.and.bubble.right"
            case .emprendimiento: return "lightbulb.fill"
            case .liderazgo: return "flag.fill"
            case .trabajoEnEquipo: return "person.3.fill"
            case .inversiones: return "chart.bar.fill"
        }
    }
    
    static func fromRecordValue(_ value: Int) -> Self? {
        switch value {
            case 1: return .educacion
            case 2: return .cocina
            case 3: return .fiesta
            case 4: return .oficina
            case 5: return .ventas
            case 6: return .parque
            case 7: return .entrevistaTrabajo
            case 8: return .salud
            case 9: return .deporte
            case 10: return .viajes
            case 11: return .moda
            case 12: return .musica
            case 13: return .cine
            case 14: return .literatura
            case 15: return .tecnologia
            case 16: return .arte
            case 17: return .historia
            case 18: return .naturaleza
            case 19: return .automovilismo
            case 20: return .juegos
            case 21: return .ciencia
            case 22: return .economia
            case 23: return .politica
            case 24: return .filosofia
            case 25: return .psicologia
            case 26: return .idiomas
            case 27: return .matematicas
            case 28: return .fisica
            case 29: return .quimica
            case 30: return .biologia
            case 31: return .geografia
            case 32: return .astronomia
            case 33: return .medicina
            case 34: return .ingenieria
            case 35: return .arquitectura
            case 36: return .derecho
            case 37: return .nutricion
            case 38: return .gastronomia
            case 39: return .carpinteria
            case 40: return .electricidad
            case 41: return .agricultura
            case 42: return .mineria
            case 43: return .pesca
            case 44: return .construccion
            case 45: return .manufactura
            case 46: return .comercio
            case 47: return .hosteleria
            case 48: return .servicioCliente
            case 49: return .seguridad
            case 50: return .medioAmbiente
            case 51: return .fotografia
            case 52: return .videojuegos
            case 53: return .animacion
            case 54: return .redesSociales
            case 55: return .programacion
            case 56: return .diseñoGrafico
            case 57: return .arteDigital
            case 58: return .comercioElectronico
            case 59: return .robotica
            case 60: return .realidadVirtual
            case 61: return .ciberseguridad
            case 62: return .nanotecnologia
            case 63: return .biotecnologia
            case 64: return .psiquiatria
            case 65: return .pediatria
            case 66: return .dermatologia
            case 67: return .cardiologia
            case 68: return .primerosAuxilios
            case 69: return .saludMental
            case 70: return .higiene
            case 71: return .fitness
            case 72: return .danza
            case 73: return .teatro
            case 74: return .pintura
            case 75: return .escultura
            case 76: return .poesia
            case 77: return .periodismo
            case 78: return .historiaArte
            case 79: return .entretenimiento
            case 80: return .jardineria
            case 81: return .decoracion
            case 82: return .negocios
            case 83: return .sociologia
            case 84: return .ecologia
            case 85: return .veterinaria
            case 86: return .farmacia
            case 87: return .computacion
            case 88: return .electronica
            case 89: return .mecanica
            case 90: return .manualidades
            case 91: return .belleza
            case 92: return .reposteria
            case 93: return .bebidas
            case 94: return .hospitalidad
            case 95: return .turismo
            case 96: return .novela
            case 97: return .cuento
            case 98: return .comic
            case 99: return .emprendimiento
            case 100: return .liderazgo
            case 101: return .trabajoEnEquipo
            case 102: return .inversiones
            default: return nil
        }
    }
}
