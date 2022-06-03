bool traverse(const char* str, unsigned int n) {
  unsigned int idx = 0;
  unsigned char c;
s0:
  if (idx >= n) return false;
  c = str[idx++];
  if (c >= 97 && c <= 122) goto s1;
  return false;
s1:
  if (idx >= n) return false;
  c = str[idx++];
  if (c >= 48 && c <= 57) return true;
  return false;
}