# Lab 5 — Encoding forensics
Pair: Dautkaliyeva Diana
Machine: macOS, LibreOffice calc, GitHub
Date: 14 Nov 2026

## What I did

I ran commands to diagnose the file and fix the encoding.

```bash
$ file evidence/staff-broken.csv
evidence/staff-broken.csv: Non-ISO extended-ASCII text, with CRLF line terminators
```

```bash
$ xxd evidence/staff-broken.csv | head -n 2
00000000: 4944 3b64 e0ec e8eb e8ff 3bc8 ecff 3bce  ID;d........;...;.
00000010: 3c20 f2e4 e5eb 3bc4 eee1 e6ed eef1 f2fc  < ....;......... 
```

I fixed the file using the terminal to ensure proper UTF-8 encoding:

```bash
$ iconv -f WINDOWS-1251 -t UTF-8 evidence/staff-broken.csv | sed 's/\r$//' > evidence/staff-fixed.csv
```

## Result

The file is now encoded in UTF-8. The command `file evidence/staff-fixed.csv` confirms it is UTF-8 text. It opens correctly in Numbers and LibreOffice without any garbled text.

## What did not work the first time

At first, I tried to use LibreOffice Calc to save the file as a CSV. However, the export dialog did not properly apply the UTF-8 encoding, and the file remained broken. I resolved this by using the `iconv` command in the terminal instead.

## Evidence

* `evidence/staff-broken.csv` — the original broken file.
* `evidence/file-before.txt` — shows the `file` command output (Non-ISO, CRLF).
* `evidence/hexdump-before.txt` — shows the single-byte Cyrillic and CRLF.
* `evidence/staff-fixed.csv` — the fixed UTF-8 file.
* `evidence/file-after.txt` — shows the file is now UTF-8.
* `evidence/hexdump-after.txt` — shows the two-byte Cyrillic and LF.
* `evidence/opens-correctly.png` — screenshot proving the text is correct in LibreOffice.
