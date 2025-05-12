# Serial Number Parser

Queue-based state machine serial number parser, designed to validate different types of serial numbers according to selectable criteria. Ensures traceability and classification of devices based on their serial number format.

## Table of Contents

* [Overview](#overview)
* [Available Parse Modes](#available-parse-modes)
* [Parser Structure](#parser-structure)
* [Defined States](#defined-states)
* [Defined Errors](#defined-errors)
* [Outputs](#outputs)

---

## Overview

This parser implements a queue-based state machine that allows selecting between different validation modes to analyze serial numbers. The modular architecture favors extension and maintenance, with dedicated subVIs for each type of analysis and robust error handling.

## Available Parse Modes

Parser behavior is determined by the `Parse Mode` parameter (enum):

* `FREE PASS`: Accepts any non-empty serial number.
* `LENGTH BASED`: Validates that the serial number length is within a defined range.
* `REGEX BASED`: Validates the serial number according to the device type and an associated regular expression.
* `AUTO`: Identifies the device type by sequentially testing regular expressions.

## Parser Structure

### Input Data

When the state machine initializes, the following parameters are encapsulated in a cluster:

* `SN In`: string of the serial number to be evaluated
* `Regex`: 2D array of regular expressions, where the first row contains the key names from the `.ini` file and the second row contains the corresponding expressions
* `Parse Mode`: enum with the modes mentioned above
* `Length Range`: cluster with `Min` and `Max` (integer values)
* `Device Type`: enum (`BGH Asset`, `BGH Product`, `SAMSUNG Product`)

### Initial Flow

Two states are enqueued at the beginning:

1. `Initialize`: loads the parameters.
2. `Dispatch Parse Handler`: enqueues the corresponding states according to the selected analysis mode.

## Defined States

### Common to All Modes

#### `Check SN Empty`

* Verifies that the serial number is not an empty string.
* If empty: SN ok? = FALSE, Device Type out = "", and error 5101.
* If not empty: SN ok? = TRUE, Device Type out = `GENERIC Product`.

### By Parse Mode

#### `FREE PASS`

* States: `Check SN Empty` → `Free Pass Parser` → `Shutdown`
* `Free Pass Parser`: simply reinforces the output as valid.

#### `LENGTH BASED`

* States: `Check SN Empty` → `Length Based Parser` → `Shutdown`
* `Length Based Parser`: validates SN length and checks the Min/Max range consistency.
* Errors:

  * 5102: Max and Min = 0
  * 5103: Min > Max
  * 5104: Length out of range

#### `REGEX BASED`

* States: `Check SN Empty` → `Regex Based Parser` → `Shutdown`
* `Regex Based Parser`: evaluates the SN with the regex associated with the selected device type.
* Error 5105: SN does not match the selected regex.

#### `AUTO`

* States: `Check SN Empty` → `Auto Parser` → `Shutdown`
* `Auto Parser`: loops through the regular expressions and determines the device type if a match is found.
* Error 5106: SN does not match any regex.

## Defined Errors

| Code | Description                                                                                                                 |
| ---- | --------------------------------------------------------------------------------------------------------------------------- |
| 5101 | The serial number received in the parser is an empty string. Not allowed.                                                   |
| 5102 | The maximum and minimum lengths cannot be equal to zero. Not allowed.                                                       |
| 5103 | The maximum length must be greater than the minimum length. Min > Max is not allowed.                                       |
| 5104 | The length of the serial number must be within the range set by the minimum and maximum. Serial number length out of range. |
| 5105 | The serial number does not conform to the selected regular expression.                                                      |
| 5106 | The serial number does not match any of the defined regular expressions.                                                    |

## Outputs

The module returns a cluster with the following fields:

* `SN`: resulting serial number (empty if error)
* `SN ok?`: boolean indicating whether the analysis was successful
* `Device Type Out`: inferred or confirmed device type

---

### Author

Developed by Ramón, Tierra del Fuego, Argentina.

---

![imagen](https://github.com/user-attachments/assets/59ab3c3f-3ee9-4622-adac-6b64ec61bfce)

