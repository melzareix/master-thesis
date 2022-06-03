bool traverse(FiniteAutomaton* fa, char* s, int slen) {
  FiniteAutomatonState* p = fa->initial_state;
  for (int i = 0; i < slen; i++) {
    FiniteAutomatonState* q = p.next(s[i]);
    if (q == nullptr)
      return false;
    if (q->accept) return true;
    p = q;
  }
  return false;
}