### SomeContract README

This README provides an overview of the `SomeContract` Flow contract, detailing the variables and functions defined within it and their respective access scopes.

#### Variables:

1. **`a`**:
   - Read Scope: All areas (1, 2, 3, and 4)
   - Write Scope: Areas 1, 2, 3 and 4
2. **`b`**:
   - Read Scope: All areas (1, 2, 3, and 4)
   - Write Scope: Areas 1
3. **`c`**:
   - Read Scope: All areas (1, 2, 3, and 4)
   - Write Scope: Area 1
4. **`d`**:
   - Read Scope: All areas 1

#### Functions:

1. **`publicFunc()`**:
   - Call Scope: All areas (1, 2, 3, and 4)
2. **`contractFunc()`**:
   - Call Scope: Areas 1, 2 and 3
3. **`privateFunc()`**:
   - Call Scope: Area 1
