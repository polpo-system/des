MODULE DESTest;  (** DESTest.Run: the test vector of DES (key "Elephant") encrypted and decrypted *)

IMPORT DES, Out := out;

VAR fails, checks: LONGINT;

PROCEDURE Check(what: ARRAY OF CHAR; ok: BOOLEAN);
BEGIN
  INC(checks);
  IF ~ok THEN INC(fails); Out.String("FAIL "); Out.String(what); Out.Ln END
END Check;

PROCEDURE Run*;
VAR clear, back: ARRAY 17 OF CHAR; cipher: ARRAY 16 OF CHAR; want: ARRAY 16 OF INTEGER; i: INTEGER; ok: BOOLEAN;
BEGIN
  fails := 0; checks := 0;
  want[0] := 182; want[1] := 176; want[2] := 143; want[3] := 211; want[4] := 152; want[5] := 52; want[6] := 119; want[7] := 10;
  want[8] := 55; want[9] := 133; want[10] := 11; want[11] := 241; want[12] := 120; want[13] := 232; want[14] := 7; want[15] := 180;
  DES.SetKey("Elephant"); clear := "Hello, this is a";
  DES.encrypt(clear, 0, cipher, 0); DES.encrypt(clear, 8, cipher, 8);
  ok := TRUE; i := 0; WHILE i < 16 DO IF ORD(cipher[i]) # want[i] THEN ok := FALSE END; INC(i) END;
  Check("the cipher of the test vector", ok);
  DES.decrypt(cipher, 0, back, 0); DES.decrypt(cipher, 8, back, 8); back[16] := 0X;
  Check("decrypted back", back = "Hello, this is a");
  Out.String("DESTest: "); Out.Int(checks, 0); Out.String(" checks, "); Out.Int(fails, 0); Out.String(" failed"); Out.Ln
END Run;

END DESTest.
