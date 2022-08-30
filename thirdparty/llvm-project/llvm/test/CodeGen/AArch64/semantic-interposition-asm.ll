; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=aarch64 -relocation-model=pic < %s | FileCheck %s

;; Test that we use the local alias for dso_local functions in inline assembly.

@gv0 = dso_local global i32 0
@gv1 = dso_preemptable global i32 1

define i64 @test_var() nounwind {
; CHECK-LABEL: test_var:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    //APP
; CHECK-NEXT:    adrp x0, .Lgv0$local
; CHECK-NEXT:    ldr w0, [x0, :lo12:.Lgv0$local]
; CHECK-NEXT:    adrp x8, gv1
; CHECK-NEXT:    ldr w8, [x8, :lo12:gv1]
; CHECK-NEXT:    add x0, x8, x0
; CHECK-NEXT:    //NO_APP
; CHECK-NEXT:    ret
entry:
  %0 = tail call i64 asm "adrp $0, $1\0Aldr ${0:w}, [$0, :lo12:$1]\0Aadrp x8, $2\0Aldr w8, [x8, :lo12:$2]\0Aadd $0,x8,$0", "=r,S,S,~{x8}"(i32* nonnull @gv0, i32* nonnull @gv1)
  ret i64 %0
}

define dso_local void @fun0() nounwind {
; CHECK-LABEL: fun0:
; CHECK:       .Lfun0$local:
; CHECK-NEXT:    .type .Lfun0$local,@function
; CHECK-NEXT:  // %bb.0: // %entry
; CHECK-NEXT:    ret
entry:
  ret void
}

define dso_preemptable void @fun1() nounwind {
; CHECK-LABEL: fun1:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    ret
entry:
  ret void
}

define i64 @test_fun() nounwind {
; CHECK-LABEL: test_fun:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    //APP
; CHECK-NEXT:    adrp x0, :got:.Lfun0$local
; CHECK-NEXT:    ldr x0, [x0, :got_lo12:.Lfun0$local]
; CHECK-NEXT:    adrp x8, :got:fun1
; CHECK-NEXT:    ldr x8, [x8, :got_lo12:fun1]
; CHECK-NEXT:    //NO_APP
; CHECK-NEXT:    ret
entry:
  %0 = tail call i64 asm "adrp $0, :got:$1\0Aldr $0, [$0, :got_lo12:$1]\0Aadrp x8, :got:$2\0Aldr x8, [x8, :got_lo12:$2]", "=r,S,S,~{x8}"(void ()* nonnull @fun0, void ()* nonnull @fun1)
  ret i64 %0
}