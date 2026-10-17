# des

DES for [polpo](https://github.com/polpo-system/polpo): the Data Encryption Standard, a block cipher
of 64 bits with a key of 56 (`DES.SetKey`, `encrypt`, `decrypt`). DES is long broken as a
protection of data; it is here because protocols still use it, as VNC for the challenge of its
password (gadgets-vnc).

```
portia.Install des
```

## What is here

    src/DES.Mod
    test/DESTest.Mod

The source comes from ETH Linux Oberon (OLR, 2017-06-18), converted from an Oberon text to plain
text; the first commit has it unchanged. It compiles unchanged with all five of polpo's compilers
(x86, ARM, ARMv7, RISC-V, MIPS).

## Tests

    DESTest.Run      2 checks: the test vector (key "Elephant", "Hello, this is a") encrypted and
                     decrypted; no display needed

The license is GPL-3 (`LICENSE`); the code comes from ETH Oberon, whose license (`LICENSE.ETH`)
asks to keep its copyright notice and conditions, which `LICENSE.ETH` does.
