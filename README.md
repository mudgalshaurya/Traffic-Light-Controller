# Digital Traffic Light Controller

**Author:** Shaurya Mudgal

This repository contains the hardware RTL design for a Digital Traffic Light Controller. It is designed to safely simulate and manage realistic intersection signaling for a standard four-way (North/South and East/West) intersection.

## 📌 Project Overview

The primary objective of this project is to manage the strict, mutually exclusive timing sequences required for safe traffic control. The design ensures smooth and predictable switching between states without any dangerous timing overlaps or conflicting signals.

Key architectural features include:
1. **4-State FSM:** A highly reliable Finite State Machine programmed to handle the safe and logical transitions between Green, Yellow, and Red light states across both traffic axes.
2. **Integrated Timer Counters:** Custom hardware timer logic integrated directly into the controller to accurately scale the system clock and adjust the exact duration of each light phase.
3. **Parametrized Phasing:** The design allows for modular adjustments to the `green_time` and `yellow_time` durations without requiring underlying logic modifications.
4. **Binary Light Encoding:** Outputs follow a standard 3-bit encoding for straightforward integration with physical LED hardware (`001` for Green, `010` for Yellow, `100` for Red).

## 🗂️ File Structure

The repository is partitioned into the core structural RTL components and the simulation verification environment.

### 1. Hardware (RTL) - Verilog
*   `top_traffic_light.v`: The top-level integration module that instantiates and synchronizes the state machine with the custom timer module.
*   `fsm_traffic_light.v`: The core control logic housing the 4-state machine and intersection safety constraints.
*   `timmer_traffic_light.v`: The dedicated hardware counter responsible for generating the synchronized tick signals used to drive phase transitions.

### 2. Verification Environment - Verilog
*   `tb_traffic_light.v`: The behavioral testbench utilized to simulate accelerated intersection timing. It validates the FSM logic and ensures that North/South and East/West axes never output conflicting green or yellow states simultaneously.

## 🚀 Project Status & Milestones

**Hardware Design & Integration (Completed)**
*   Engineered the traffic control system from scratch using standard Verilog HDL.
*   Built the core control logic using a deterministic 4-state FSM.
*   Successfully implemented isolated timer counters to independently manage phase durations.

**Simulation & Verification (Completed)**
*   Developed a dedicated testbench to simulate continuous intersection operation.
*   Executed behavioral simulations in Xilinx Vivado.
*   Verified the accurate generation of mutually exclusive light phases, proving safe intersection management across all transition boundaries.

## 🛠️ Tools and Technologies

*   **Hardware Description Language:** Verilog
*   **Simulation & Synthesis:** Xilinx Vivado (Behavioral Simulation)
