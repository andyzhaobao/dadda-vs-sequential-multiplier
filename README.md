# 8×8 Multipliers — Parallel vs. Sequential

Two implementations of the same 8×8 unsigned multiply, built to quantify the
area/latency tradeoff between a fully parallel and a resource-shared design:

- **Dadda tree multiplier** — single cycle, hand-built at gate level
- **Sequential shift-add multiplier** — 8 cycles, one shared adder

Coursework project, NC State University. Simulated and synthesized in Xilinx Vivado.

---

## Result

| | Dadda tree | Sequential |
|---|---|---|
| Latency | 1 cycle | 8 cycles |
| Adder cells | 56 (35 full + 7 half + 14-bit RCA) | 1 × 16-bit adder |
| Control logic | None | Load/busy FSM + 4-bit counter |

Same function, same interface width, two very different points on the area/latency
curve. The sequential version trades 8× the latency for roughly an order of
magnitude fewer adder cells.

<!-- Add LUT/FF counts from your synthesis reports here if you captured them —
     measured numbers are stronger than cell counts. -->

---

## Dadda tree multiplier

Built entirely from gate primitives, with every intermediate sum and carry net
routed by hand.

**Partial product generation.** 64 AND primitives form the 8×8 partial-product
matrix.

**Compression network.** Four stages of full and half adders reduce the column
heights toward two rows:

```
column height:  6 → 4 → 3 → 2
```

35 full adders and 7 half adders total. Dadda's approach defers compression as
long as possible — each stage reduces only as much as needed to reach the next
target height, which uses fewer adder cells than a Wallace tree reducing greedily
at every stage.

**Final addition.** A 14-bit ripple-carry adder collapses the remaining two rows
into the product.

<!-- docs/dadda-tree.png -->

---

## Sequential multiplier

A shift-and-add engine reusing a single 16-bit adder across 8 cycles:

- Load/busy control distinguishes operand capture from the multiply sequence
- Each cycle conditionally accumulates the shifted multiplicand based on the
  current multiplier LSB
- A 4-bit iteration counter tracks progress and asserts completion

The interesting part of this design is the control, not the arithmetic — the
adder is trivial once the sequencing is right.

---

## Verification

Both designs were driven with the same testbench cases and their outputs compared
against each other and against expected products, so the parallel design acts as a
reference model for the sequential one.

<!-- Fill in the specific cases you ran: exhaustive, corner values, random, etc. -->

---

## Repository layout

```
rtl/dadda/        Gate-level Dadda tree
rtl/sequential/   Shift-add datapath and control
tb/               Shared testbench
docs/             Compression diagram, waveforms, synthesis reports
```

---

## Notes

Posted publicly with the instructor's permission. If you are currently enrolled
in this course, submitting this work as your own is an academic integrity
violation.
