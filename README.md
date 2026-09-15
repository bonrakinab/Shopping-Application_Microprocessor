# Shopping Management System — 8086 Assembly

A menu-driven shopping application written in **8086 assembly language**. The project simulates a small retail checkout flow using DOS/BIOS interrupts for terminal input/output and implements product selection, quantity handling, discounts, repeated purchases, and total calculation at the assembly level.

## Overview

The application presents a fixed catalogue of clothing and footwear items. A user selects an item by key, enters a quantity, optionally applies a discount, and can continue adding purchases before the program prints the total amount.

The project was built as a **microprocessor/assembly-language project** and focuses on arithmetic, control flow, procedures, keyboard input, and text-mode output without a high-level runtime.

## Product catalogue

The source defines nine products with fixed prices:

| Key | Item | Price |
|---:|---|---:|
| 1 | Casual Shirt (Male) | 150 USD |
| 2 | Formal Shirt (Male) | 140 USD |
| 3 | Pant (Male) | 210 USD |
| 4 | Male Shoes | 350 USD |
| 5 | Casual Shirt (Female) | 140 USD |
| 6 | Pant (Female) | 220 USD |
| 7 | Female Shoes | 310 USD |
| 8 | Panjabi | 180 USD |
| 9 | Kurti | 225 USD |

## Application flow

```text
Start
  │
  ▼
Display catalogue
  │
  ▼
Choose product key
  │
  ▼
Enter quantity
  │
  ▼
price × quantity
  │
  ▼
Enter discount
  │
  ▼
Update running amount
  │
  ├── Buy more → return to catalogue
  │
  └── Finish → display total
```

Invalid product, quantity, and discount input paths are handled by dedicated error branches that prompt the user again.

## Implementation details

The program is organized around labels and procedures for:

- Catalogue display
- Product-price selection
- Multi-digit numeric input
- Quantity multiplication
- Discount subtraction
- Running-total accumulation
- Decimal number output
- Repeat-purchase prompts
- Invalid-input handling

### DOS and BIOS interrupts

The source uses classic x86 software interrupts, including:

- `INT 21H` for keyboard and text I/O
- `INT 10H` for text/video-related console behavior

### Numeric input

The input routines read ASCII digits, convert them into numeric values, and accumulate multi-digit values using base-10 arithmetic.

### Checkout arithmetic

The selected unit price is stored, multiplied by the requested quantity, reduced by the entered discount, and added to the running purchase total.

## Repository structure

```text
Shopping-Application_Microprocessor/
├── shopping.asm   # complete 8086 assembly implementation
└── README.md
```

## Running the project

The code follows MASM/TASM-style 16-bit DOS assembly conventions (`.MODEL SMALL`, `.STACK`, `.DATA`, `.CODE`). A compatible environment is required.

Typical options include:

- DOSBox with MASM/TASM
- emu8086
- Another 8086-compatible educational assembler/emulator

A representative MASM-style build flow is:

```text
masm shopping.asm;
link shopping.obj;
shopping.exe
```

Exact commands depend on the assembler/emulator being used.

## Concepts demonstrated

- 8086 registers and memory variables
- Branching with `CMP`, conditional jumps, and labels
- Integer multiplication and subtraction
- Stack operations (`PUSH` / `POP`)
- Procedures
- ASCII-to-integer conversion
- Integer-to-decimal output
- DOS/BIOS interrupt-driven I/O
- Menu-driven application logic

## Limitations

This is an educational console application rather than a production shopping system. Product data and prices are hard-coded, monetary values use integer arithmetic, and there is no persistent inventory, user account, database, or external payment integration.

## Possible improvements

- Store the product catalogue in structured arrays/tables
- Track inventory quantities
- Support decimal/currency-safe calculations
- Print itemized receipts
- Allow removing items before checkout
- Add clearer modular procedures and comments
- Port the concept to a modern x86 assembler for easier execution

## Tech stack

- **Language:** 8086 Assembly
- **Environment:** 16-bit DOS-style execution
- **Concepts:** microprocessors, assembly programming, arithmetic routines, interrupt-driven I/O

---

This repository is preserved as a low-level shopping-management exercise showing how an interactive checkout workflow can be implemented directly in 8086 assembly.
