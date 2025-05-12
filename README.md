# Serial Number Parser

Parser de número de serie basado en una máquina de estados con manejo por cola, diseñado para validar distintos tipos de números de serie conforme a criterios seleccionables. Permite asegurar la trazabilidad y clasificación de dispositivos según su formato de número de serie.

## Tabla de contenidos

* [Descripción general](#descripción-general)
* [Modos de análisis disponibles](#modos-de-análisis-disponibles)
* [Estructura del parser](#estructura-del-parser)
* [Estados definidos](#estados-definidos)
* [Errores definidos](#errores-definidos)
* [Salidas](#salidas)

---

## Descripción general

Este parser implementa una máquina de estados basada en colas (Queue-Based State Machine), que permite seleccionar entre distintos modos de validación para analizar números de serie. La arquitectura modular favorece su extensión y mantenimiento, con subVIs dedicados a cada tipo de análisis y manejo robusto de errores.

## Modos de análisis disponibles

El comportamiento del parser se determina mediante el parámetro `Parse Mode` (enum):

* `FREE PASS`: Acepta cualquier número de serie no vacío.
* `LENGTH BASED`: Valida que la longitud del número de serie esté dentro de un rango definido.
* `REGEX BASED`: Valida el número de serie según el tipo de dispositivo y una expresión regular asociada.
* `AUTO`: Identifica el tipo de dispositivo mediante prueba secuencial de expresiones regulares.

## Estructura del parser

### Datos de entrada

Al inicializar la máquina de estado, se encapsulan los siguientes parámetros en un clúster:

* `SN In`: string del número de serie a evaluar
* `Regex`: array de expresiones regulares
* `Parse Mode`: enum con las opciones mencionadas arriba
* `Length Range`: clúster con `Min` y `Max` (valores enteros)
* `Device Type`: enum (`BGH Asset`, `BGH Product`, `SAMSUNG Product`)

### Flujo inicial

Se encolan dos estados al comienzo:

1. `Initialize`: carga los parámetros.
2. `Dispatch Parse Handler`: encola los estados correspondientes según el modo de análisis.

## Estados definidos

### Comunes a todos los modos

#### `Check SN Empty`

* Verifica que el número de serie no sea una cadena vacía.
* Si está vacío: SN ok? = FALSE, Device Type out = "", y error 5101.
* Si no está vacío: SN ok? = TRUE, Device Type out = `GENERIC Product`.

### Por modo de análisis

#### `FREE PASS`

* Estados: `Check SN Empty` → `Free Pass Parser` → `Shutdown`
* `Free Pass Parser`: simplemente refuerza la salida como válida.

#### `LENGTH BASED`

* Estados: `Check SN Empty` → `Length Based Parser` → `Shutdown`
* `Length Based Parser`: valida longitud del SN, verifica consistencia del rango Min/Max.
* Errores:

  * 5102: Max y Min = 0
  * 5103: Min > Max
  * 5104: Longitud fuera de rango

#### `REGEX BASED`

* Estados: `Check SN Empty` → `Regex Based Parser` → `Shutdown`
* `Regex Based Parser`: evalúa el SN con la expresión regular asociada al tipo de dispositivo elegido.
* Error 5105: el SN no coincide con la regex seleccionada.

#### `AUTO`

* Estados: `Check SN Empty` → `Auto Parser` → `Shutdown`
* `Auto Parser`: recorre las expresiones regulares y determina el tipo de dispositivo si encuentra coincidencia.
* Error 5106: el SN no coincide con ninguna de las expresiones regulares.

## Errores definidos

| Código | Descripción                                                                                                                 |
| ------ | --------------------------------------------------------------------------------------------------------------------------- |
| 5101   | The serial number received in the parser is an empty string. Not allowed.                                                   |
| 5102   | The maximum and minimum lengths cannot be equal to zero. Not allowed.                                                       |
| 5103   | The maximum length must be greater than the minimum length. Min > Max is not allowed.                                       |
| 5104   | The length of the serial number must be within the range set by the minimum and maximum. Serial number length out of range. |
| 5105   | The serial number does not conform to the selected regular expression.                                                      |
| 5106   | The serial number does not match any of the defined regular expressions.                                                    |

## Salidas

El módulo retorna un clúster con los siguientes campos:

* `SN`: número de serie resultante (vacío si hay error)
* `SN ok?`: booleano indicando si el análisis fue exitoso
* `Device Type Out`: tipo de dispositivo inferido o confirmado

---

### Autor

Desarrollado por Ramón, Tierra del Fuego, Argentina.

---


