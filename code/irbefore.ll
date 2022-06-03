define i1 @traverse(i8* %0, i32 %1) {
entry:
  %idx = alloca i32, align 4
  store i32 0, i32* %idx, align 4
  br label %s4
s4:                                               ; preds = %entry
  %2 = load i32, i32* %idx, align 4
  %3 = icmp uge i32 %2, %1
  br i1 %3, label %bounds_then, label %bounds_cont
bounds_then:                                      ; preds = %s4
  ret i1 false
bounds_cont:                                      ; preds = %s4
  %4 = getelementptr i8, i8* %0, i32 %2
  %5 = load i8, i8* %4, align 1
  %6 = add i32 %2, 1
  store i32 %6, i32* %idx, align 4
  %7 = icmp uge i8 %5, 97
  %8 = icmp ule i8 %5, 122
  %9 = and i1 %7, %8
  br i1 %9, label %s5, label %s4_nt
s4_nt:                                            ; preds = %bounds_cont
  ret i1 false
s5:                                               ; preds = %bounds_cont
  %10 = load i32, i32* %idx, align 4
  %11 = icmp uge i32 %10, %1
  br i1 %11, label %bounds_then1, label %bounds_cont2
bounds_then1:                                     ; preds = %s5
  ret i1 false
bounds_cont2:                                     ; preds = %s5
  %12 = getelementptr i8, i8* %0, i32 %10
  %13 = load i8, i8* %12, align 1
  %14 = add i32 %10, 1
  store i32 %14, i32* %idx, align 4
  %15 = icmp uge i8 %13, 48
  %16 = icmp ule i8 %13, 57
  %17 = and i1 %15, %16
  br i1 %17, label %s7, label %s5_nt
s5_nt:                                  ; preds = %bounds_cont2
  ret i1 false
s7:                                     ; preds = %bounds_cont2
  ret i1 true
}