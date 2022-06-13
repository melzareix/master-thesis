inline unsigned nextCodepoint(const char* str, unsigned& idx) {
  unsigned c = 0;
  char b1 = str[idx];
  unsigned byteLen = getLength(b1); // get number of utf-8 bytes
  c = readMultiByte(str, idx, byteLen); // read full code point
  idx += byteLen;
  return c;
}
bool traverse(const char * str, unsigned int n) {
  unsigned int idx = 0;
  unsigned int c;
  s0:
    if (idx >= n) return false;
    c = nextCodepoint(str, idx);
    if (c == 0xA3) return true; /*sterling pound codepoint*/
  return false;
}