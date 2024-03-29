# Computer Security Section Task

## Required Tasks

1. Implement simple encryption and decryption using a numeric key (`simple`).
2. Implement rail fence encryption and decryption using a numeric key (`rail_fence`).
3. Implement caesar encryption and decryption using a string key (`caesar`).
4. Implement encryption and decryption using Columnar Transposition.

## Tasks Completed

- [x] Implement simple encryption and decryption using a numeric key (`simple`).
- [x] Implement rail fence encryption and decryption using a numeric key (`rail_fence`).
- [x] Implement caesar encryption and decryption using a string key (`caesar`).
- [x] Implement encryption and decryption using Columnar Transposition.

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
