# Computer Security Section Task

## Required Tasks

1. Implement rail fence encryption and decryption using a numeric key (`rail_fence`).
2. Implement caesar encryption and decryption using a string key (`caesar`).
3. Implement encryption and decryption using Columnar Transposition.

## Tasks Completed

- [x] Implement rail fence encryption and decryption using a numeric key (`rail_fence`).
- [x] Implement caesar encryption and decryption using a string key (`caesar`).
- [x] Implement encryption and decryption using Columnar Transposition.

### Rail Fence

> rail_fence_encryption("defend the east wall", 3);

    DNETLEEDHESWLFTAA

> rail_fence_decryption("DNETLEEDHESWLFTAA", 3);

    DEFENDTHEEASTWALL

### Caesar

> caesar_encryption("Hello");

    Key:
        zleainqtrxbhojckpymsgwufdv
    Cipher Text:
        TIHHC

### Columnar Transposition Example

> row_col_encryption("The tomato is a plant in the nightshade family", "tomato");

    TINESAXEOAHTFXHTLTHEYMAIIAIXTAPNGDLOSTNHMX

> row_col_decryption("TINESAXEOAHTFXHTLTHEYMAIIAIXTAPNGDLOSTNHMX", "tomato");

    THETOMATOISAPLANTINTHENIGHTSHADEFAMILYXXXX
