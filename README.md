# Computer Security Algorithms

## Required Tasks

1. Implement simple encryption and decryption using a numeric key (`simple`).
2. Implement rail fence encryption and decryption using a numeric key (`rail_fence`).
3. Implement caesar encryption and decryption using a string key (`caesar`).
4. Implement encryption and decryption using Columnar Transposition.
5. Implement encryption and decryption using RC4.
6. Implement encryption and decryption using Double Transposition.
7. Implement encryption and decryption using One time pad 2.

## Tasks Completed

- [x] Implement simple encryption and decryption using a numeric key (`simple`).
- [x] Implement rail fence encryption and decryption using a numeric key (`rail_fence`).
- [x] Implement caesar encryption and decryption using a string key (`caesar`).
- [x] Implement encryption and decryption using Columnar Transposition.
- [x] Implement encryption and decryption using RC4.
- [x] Implement encryption and decryption using Double Transposition.
- [x] Implement encryption and decryption using One time pad 2.

### Simple

> simple_encryption("Hello");

    WMLLB
    JNXAMKDWRFTLPIBGCHEVSYUOQZ

> simple_decryption("WMLLB","JNXAMKDWRFTLPIBGCHEVSYUOQZ");

    HELLO

### Rail Fence

> rail_fence_encryption("defend the east wall", 3);

    DNETLEEDHESWLFTAA

> rail_fence_decryption("DNETLEEDHESWLFTAA", 3);

    DEFENDTHEEASTWALL

### Caesar

> caesar_encryption("Hello", 7);

    OLSSV

> caesar_decryption("OLSSV", 7);

    HELLO

### Columnar Transposition

> row_col_encryption("The tomato is a plant in the nightshade family", "tomato");

    TINESAXEOAHTFXHTLTHEYMAIIAIXTAPNGDLOSTNHMX

> row_col_decryption("TINESAXEOAHTFXHTLTHEYMAIIAIXTAPNGDLOSTNHMX", "tomato");

    THETOMATOISAPLANTINTHENIGHTSHADEFAMILYXXXX

### Double Transposition

> double_transposition_encrypt('helloworld', [3 5 1 4 2], [2 1]);

    ciphertext: WODLEHROLL

> double_transposition_decrypt('WODLEHROLL', [3 5 1 4 2], [2 1]);

    plaintext: helloworld

### One time pad 2

> otp_encryption('hello','jkosg');

    ciphertext: rpaev

> otp_decryption('rpaev','jkosg');

    plaintext: hello

### RC4

> rc4_encrypt('Hello','key');

    ciphertext: 1011011110011011011011100110100001101001

> rc4_decrypt('1011011110011011011011100110100001101001','key');

    plaintext: Hello
