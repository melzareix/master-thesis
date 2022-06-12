inline unsigned nextCodepoint(const char* str, unsigned& idx) {
  unsigned c = 0;
  char b1 = str[idx];
  // determine number of utf8 bytes
  unsigned byteLen = multiByteSequenceLength(b1);
  // read as utf32 string
  c = readMultiByte(str, b1, idx, byteLen);
  idx += byteLen;
  return c;
}

bool traverse(const char * str, unsigned int n) {
  unsigned int idx = 0;
  unsigned int c;
  s0:
    if (idx >= n) return false;
    c = nextCodepoint(str, idx);
    if (c == 0xA3 /*sterling pound codepoint*/) return true;
  return false;
}