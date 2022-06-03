define i1 @traverse(i8* %0, i32 %1) {
entry:
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %common.ret, label %bounds_cont
common.ret:                                       ; preds = %bounds_cont2, %bounds_cont, %entry
  %common.ret.op = phi i1 [ false, %entry ], [ false, %bounds_cont ], [ %8, %bounds_cont2 ]
  ret i1 %common.ret.op
bounds_cont:                                      ; preds = %entry
  %3 = load i8, i8* %0, align 1
  %.off = add i8 %3, -97
  %4 = icmp ugt i8 %.off, 25
  %5 = icmp eq i32 %1, 1
  %or.cond = select i1 %4, i1 true, i1 %5
  br i1 %or.cond, label %common.ret, label %bounds_cont2
bounds_cont2:                                     ; preds = %bounds_cont
  %6 = getelementptr i8, i8* %0, i64 1
  %7 = load i8, i8* %6, align 1
  %.off4 = add i8 %7, -48
  %8 = icmp ult i8 %.off4, 10
  br label %common.ret
}