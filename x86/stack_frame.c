void func(int x) {
  int a = 0;
  int b = x;
}

/*
  Function Stack Frame

          esp---> +---------------+
                  |               |
                  |               |
                  |               |
                  |               |
                  +---------------+   -----
  reg(eax)    +-->|       10      |    0x4 = ebp - 0x8
    +----+    |   +---------------+   -----
    | 10 |----+   |       0       |    0x4 = ebp - 0x4
    +----+        +---------------+ <-----------ebp
       ^          |  return addr  |
       |          +---------------+    0x8
       +----------|       10      |
                  +---------------+   _____
*/

int main() {
  func(10);
  return 0;
}
