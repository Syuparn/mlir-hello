; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=aarch64--linux-gnu -mattr=+sve < %s | FileCheck %s

define <vscale x 8 x half> @fmla_h_sel(<vscale x 8 x i1> %pred, <vscale x 8 x half> %acc, <vscale x 8 x half> %m1, <vscale x 8 x half> %m2) {
; CHECK-LABEL: fmla_h_sel:
; CHECK:       // %bb.0:
; CHECK-NEXT:    fmla z0.h, p0/m, z1.h, z2.h
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 8 x half> %m1, %m2
  %add = fadd contract <vscale x 8 x half> %acc, %mul
  %res = select <vscale x 8 x i1> %pred, <vscale x 8 x half> %add, <vscale x 8 x half> %acc
  ret <vscale x 8 x half> %res
}

define <vscale x 4 x half> @fmla_hx4_sel(<vscale x 4 x i1> %pred, <vscale x 4 x half> %acc, <vscale x 4 x half> %m1, <vscale x 4 x half> %m2) {
; CHECK-LABEL: fmla_hx4_sel:
; CHECK:       // %bb.0:
; CHECK-NEXT:    fmla z0.h, p0/m, z1.h, z2.h
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 4 x half> %m1, %m2
  %add = fadd contract <vscale x 4 x half> %acc, %mul
  %res = select <vscale x 4 x i1> %pred, <vscale x 4 x half> %add, <vscale x 4 x half> %acc
  ret <vscale x 4 x half> %res
}

define <vscale x 2 x half> @fmla_hx2_sel(<vscale x 2 x i1> %pred, <vscale x 2 x half> %acc, <vscale x 2 x half> %m1, <vscale x 2 x half> %m2) {
; CHECK-LABEL: fmla_hx2_sel:
; CHECK:       // %bb.0:
; CHECK-NEXT:    fmla z0.h, p0/m, z1.h, z2.h
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 2 x half> %m1, %m2
  %add = fadd contract <vscale x 2 x half> %acc, %mul
  %res = select <vscale x 2 x i1> %pred, <vscale x 2 x half> %add, <vscale x 2 x half> %acc
  ret <vscale x 2 x half> %res
}

define <vscale x 4 x float> @fmla_s_sel(<vscale x 4 x i1> %pred, <vscale x 4 x float> %acc, <vscale x 4 x float> %m1, <vscale x 4 x float> %m2) {
; CHECK-LABEL: fmla_s_sel:
; CHECK:       // %bb.0:
; CHECK-NEXT:    fmla z0.s, p0/m, z1.s, z2.s
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 4 x float> %m1, %m2
  %add = fadd contract <vscale x 4 x float> %acc, %mul
  %res = select <vscale x 4 x i1> %pred, <vscale x 4 x float> %add, <vscale x 4 x float> %acc
  ret <vscale x 4 x float> %res
}

define <vscale x 2 x float> @fmla_sx2_sel(<vscale x 2 x i1> %pred, <vscale x 2 x float> %acc, <vscale x 2 x float> %m1, <vscale x 2 x float> %m2) {
; CHECK-LABEL: fmla_sx2_sel:
; CHECK:       // %bb.0:
; CHECK-NEXT:    fmla z0.s, p0/m, z1.s, z2.s
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 2 x float> %m1, %m2
  %add = fadd contract <vscale x 2 x float> %acc, %mul
  %res = select <vscale x 2 x i1> %pred, <vscale x 2 x float> %add, <vscale x 2 x float> %acc
  ret <vscale x 2 x float> %res
}

define <vscale x 2 x double> @fmla_d_sel(<vscale x 2 x i1> %pred, <vscale x 2 x double> %acc, <vscale x 2 x double> %m1, <vscale x 2 x double> %m2) {
; CHECK-LABEL: fmla_d_sel:
; CHECK:       // %bb.0:
; CHECK-NEXT:    fmla z0.d, p0/m, z1.d, z2.d
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 2 x double> %m1, %m2
  %add = fadd contract <vscale x 2 x double> %acc, %mul
  %res = select <vscale x 2 x i1> %pred, <vscale x 2 x double> %add, <vscale x 2 x double> %acc
  ret <vscale x 2 x double> %res
}

define <vscale x 8 x half> @fmls_h_sel(<vscale x 8 x i1> %pred, <vscale x 8 x half> %acc, <vscale x 8 x half> %m1, <vscale x 8 x half> %m2) {
; CHECK-LABEL: fmls_h_sel:
; CHECK:       // %bb.0:
; CHECK-NEXT:    fmls z0.h, p0/m, z1.h, z2.h
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 8 x half> %m1, %m2
  %sub = fsub contract <vscale x 8 x half> %acc, %mul
  %res = select <vscale x 8 x i1> %pred, <vscale x 8 x half> %sub, <vscale x 8 x half> %acc
  ret <vscale x 8 x half> %res
}

define <vscale x 4 x half> @fmls_hx4_sel(<vscale x 4 x i1> %pred, <vscale x 4 x half> %acc, <vscale x 4 x half> %m1, <vscale x 4 x half> %m2) {
; CHECK-LABEL: fmls_hx4_sel:
; CHECK:       // %bb.0:
; CHECK-NEXT:    fmls z0.h, p0/m, z1.h, z2.h
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 4 x half> %m1, %m2
  %sub = fsub contract <vscale x 4 x half> %acc, %mul
  %res = select <vscale x 4 x i1> %pred, <vscale x 4 x half> %sub, <vscale x 4 x half> %acc
  ret <vscale x 4 x half> %res
}

define <vscale x 2 x half> @fmls_hx2_sel(<vscale x 2 x i1> %pred, <vscale x 2 x half> %acc, <vscale x 2 x half> %m1, <vscale x 2 x half> %m2) {
; CHECK-LABEL: fmls_hx2_sel:
; CHECK:       // %bb.0:
; CHECK-NEXT:    fmls z0.h, p0/m, z1.h, z2.h
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 2 x half> %m1, %m2
  %sub = fsub contract <vscale x 2 x half> %acc, %mul
  %res = select <vscale x 2 x i1> %pred, <vscale x 2 x half> %sub, <vscale x 2 x half> %acc
  ret <vscale x 2 x half> %res
}

define <vscale x 4 x float> @fmls_s_sel(<vscale x 4 x i1> %pred, <vscale x 4 x float> %acc, <vscale x 4 x float> %m1, <vscale x 4 x float> %m2) {
; CHECK-LABEL: fmls_s_sel:
; CHECK:       // %bb.0:
; CHECK-NEXT:    fmls z0.s, p0/m, z1.s, z2.s
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 4 x float> %m1, %m2
  %sub = fsub contract <vscale x 4 x float> %acc, %mul
  %res = select <vscale x 4 x i1> %pred, <vscale x 4 x float> %sub, <vscale x 4 x float> %acc
  ret <vscale x 4 x float> %res
}

define <vscale x 2 x float> @fmls_sx2_sel(<vscale x 2 x i1> %pred, <vscale x 2 x float> %acc, <vscale x 2 x float> %m1, <vscale x 2 x float> %m2) {
; CHECK-LABEL: fmls_sx2_sel:
; CHECK:       // %bb.0:
; CHECK-NEXT:    fmls z0.s, p0/m, z1.s, z2.s
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 2 x float> %m1, %m2
  %sub = fsub contract <vscale x 2 x float> %acc, %mul
  %res = select <vscale x 2 x i1> %pred, <vscale x 2 x float> %sub, <vscale x 2 x float> %acc
  ret <vscale x 2 x float> %res
}

define <vscale x 2 x double> @fmls_d_sel(<vscale x 2 x i1> %pred, <vscale x 2 x double> %acc, <vscale x 2 x double> %m1, <vscale x 2 x double> %m2) {
; CHECK-LABEL: fmls_d_sel:
; CHECK:       // %bb.0:
; CHECK-NEXT:    fmls z0.d, p0/m, z1.d, z2.d
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 2 x double> %m1, %m2
  %sub = fsub contract <vscale x 2 x double> %acc, %mul
  %res = select <vscale x 2 x i1> %pred, <vscale x 2 x double> %sub, <vscale x 2 x double> %acc
  ret <vscale x 2 x double> %res
}

define <vscale x 8 x half> @fmad_h(<vscale x 8 x half> %m1, <vscale x 8 x half> %m2, <vscale x 8 x half> %acc) {
; CHECK-LABEL: fmad_h:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.h
; CHECK-NEXT:    fmad z0.h, p0/m, z1.h, z2.h
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 8 x half> %m1, %m2
  %res = fadd contract <vscale x 8 x half> %acc, %mul
  ret <vscale x 8 x half> %res
}

define <vscale x 4 x half> @fmad_hx4(<vscale x 4 x half> %m1, <vscale x 4 x half> %m2, <vscale x 4 x half> %acc) {
; CHECK-LABEL: fmad_hx4:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    fmad z0.h, p0/m, z1.h, z2.h
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 4 x half> %m1, %m2
  %res = fadd contract <vscale x 4 x half> %acc, %mul
  ret <vscale x 4 x half> %res
}

define <vscale x 2 x half> @fmad_hx2(<vscale x 2 x half> %m1, <vscale x 2 x half> %m2, <vscale x 2 x half> %acc) {
; CHECK-LABEL: fmad_hx2:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    fmad z0.h, p0/m, z1.h, z2.h
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 2 x half> %m1, %m2
  %res = fadd contract <vscale x 2 x half> %acc, %mul
  ret <vscale x 2 x half> %res
}

define <vscale x 4 x float> @fmad_s(<vscale x 4 x float> %m1, <vscale x 4 x float> %m2, <vscale x 4 x float> %acc) {
; CHECK-LABEL: fmad_s:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    fmad z0.s, p0/m, z1.s, z2.s
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 4 x float> %m1, %m2
  %res = fadd contract <vscale x 4 x float> %acc, %mul
  ret <vscale x 4 x float> %res
}

define <vscale x 2 x float> @fmad_sx2(<vscale x 2 x float> %m1, <vscale x 2 x float> %m2, <vscale x 2 x float> %acc) {
; CHECK-LABEL: fmad_sx2:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    fmad z0.s, p0/m, z1.s, z2.s
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 2 x float> %m1, %m2
  %res = fadd contract <vscale x 2 x float> %acc, %mul
  ret <vscale x 2 x float> %res
}

define <vscale x 2 x double> @fmad_d(<vscale x 2 x double> %m1, <vscale x 2 x double> %m2, <vscale x 2 x double> %acc) {
; CHECK-LABEL: fmad_d:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    fmad z0.d, p0/m, z1.d, z2.d
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 2 x double> %m1, %m2
  %res = fadd contract <vscale x 2 x double> %acc, %mul
  ret <vscale x 2 x double> %res
}

define <vscale x 8 x half> @fmla_h(<vscale x 8 x half> %acc, <vscale x 8 x half> %m1, <vscale x 8 x half> %m2) {
; CHECK-LABEL: fmla_h:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.h
; CHECK-NEXT:    fmla z0.h, p0/m, z1.h, z2.h
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 8 x half> %m1, %m2
  %res = fadd contract <vscale x 8 x half> %acc, %mul
  ret <vscale x 8 x half> %res
}

define <vscale x 4 x half> @fmla_hx4(<vscale x 4 x half> %acc, <vscale x 4 x half> %m1, <vscale x 4 x half> %m2) {
; CHECK-LABEL: fmla_hx4:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    fmla z0.h, p0/m, z1.h, z2.h
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 4 x half> %m1, %m2
  %res = fadd contract <vscale x 4 x half> %acc, %mul
  ret <vscale x 4 x half> %res
}

define <vscale x 2 x half> @fmla_hx2(<vscale x 2 x half> %acc, <vscale x 2 x half> %m1, <vscale x 2 x half> %m2) {
; CHECK-LABEL: fmla_hx2:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    fmla z0.h, p0/m, z1.h, z2.h
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 2 x half> %m1, %m2
  %res = fadd contract <vscale x 2 x half> %acc, %mul
  ret <vscale x 2 x half> %res
}

define <vscale x 4 x float> @fmla_s(<vscale x 4 x float> %acc, <vscale x 4 x float> %m1, <vscale x 4 x float> %m2) {
; CHECK-LABEL: fmla_s:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    fmla z0.s, p0/m, z1.s, z2.s
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 4 x float> %m1, %m2
  %res = fadd contract <vscale x 4 x float> %acc, %mul
  ret <vscale x 4 x float> %res
}

define <vscale x 2 x float> @fmla_sx2(<vscale x 2 x float> %acc, <vscale x 2 x float> %m1, <vscale x 2 x float> %m2) {
; CHECK-LABEL: fmla_sx2:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    fmla z0.s, p0/m, z1.s, z2.s
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 2 x float> %m1, %m2
  %res = fadd contract <vscale x 2 x float> %acc, %mul
  ret <vscale x 2 x float> %res
}

define <vscale x 2 x double> @fmla_d(<vscale x 2 x double> %acc, <vscale x 2 x double> %m1, <vscale x 2 x double> %m2) {
; CHECK-LABEL: fmla_d:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    fmla z0.d, p0/m, z1.d, z2.d
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 2 x double> %m1, %m2
  %res = fadd contract <vscale x 2 x double> %acc, %mul
  ret <vscale x 2 x double> %res
}

define <vscale x 8 x half> @fmls_h(<vscale x 8 x half> %acc, <vscale x 8 x half> %m1, <vscale x 8 x half> %m2) {
; CHECK-LABEL: fmls_h:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.h
; CHECK-NEXT:    fmls z0.h, p0/m, z1.h, z2.h
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 8 x half> %m1, %m2
  %res = fsub contract <vscale x 8 x half> %acc, %mul
  ret <vscale x 8 x half> %res
}

define <vscale x 4 x half> @fmls_hx4(<vscale x 4 x half> %acc, <vscale x 4 x half> %m1, <vscale x 4 x half> %m2) {
; CHECK-LABEL: fmls_hx4:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    fmls z0.h, p0/m, z1.h, z2.h
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 4 x half> %m1, %m2
  %res = fsub contract <vscale x 4 x half> %acc, %mul
  ret <vscale x 4 x half> %res
}

define <vscale x 2 x half> @fmls_hx2(<vscale x 2 x half> %acc, <vscale x 2 x half> %m1, <vscale x 2 x half> %m2) {
; CHECK-LABEL: fmls_hx2:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    fmls z0.h, p0/m, z1.h, z2.h
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 2 x half> %m1, %m2
  %res = fsub contract <vscale x 2 x half> %acc, %mul
  ret <vscale x 2 x half> %res
}

define <vscale x 4 x float> @fmls_s(<vscale x 4 x float> %acc, <vscale x 4 x float> %m1, <vscale x 4 x float> %m2) {
; CHECK-LABEL: fmls_s:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    fmls z0.s, p0/m, z1.s, z2.s
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 4 x float> %m1, %m2
  %res = fsub contract <vscale x 4 x float> %acc, %mul
  ret <vscale x 4 x float> %res
}

define <vscale x 2 x float> @fmls_sx2(<vscale x 2 x float> %acc, <vscale x 2 x float> %m1, <vscale x 2 x float> %m2) {
; CHECK-LABEL: fmls_sx2:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    fmls z0.s, p0/m, z1.s, z2.s
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 2 x float> %m1, %m2
  %res = fsub contract <vscale x 2 x float> %acc, %mul
  ret <vscale x 2 x float> %res
}

define <vscale x 2 x double> @fmls_d(<vscale x 2 x double> %acc, <vscale x 2 x double> %m1, <vscale x 2 x double> %m2) {
; CHECK-LABEL: fmls_d:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    fmls z0.d, p0/m, z1.d, z2.d
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 2 x double> %m1, %m2
  %res = fsub contract <vscale x 2 x double> %acc, %mul
  ret <vscale x 2 x double> %res
}

define <vscale x 8 x half> @fmsb_h(<vscale x 8 x half> %m1, <vscale x 8 x half> %m2, <vscale x 8 x half> %acc) {
; CHECK-LABEL: fmsb_h:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.h
; CHECK-NEXT:    fmsb z0.h, p0/m, z1.h, z2.h
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 8 x half> %m1, %m2
  %res = fsub contract <vscale x 8 x half> %acc, %mul
  ret <vscale x 8 x half> %res
}

define <vscale x 4 x half> @fmsb_hx4(<vscale x 4 x half> %m1, <vscale x 4 x half> %m2, <vscale x 4 x half> %acc) {
; CHECK-LABEL: fmsb_hx4:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    fmsb z0.h, p0/m, z1.h, z2.h
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 4 x half> %m1, %m2
  %res = fsub contract <vscale x 4 x half> %acc, %mul
  ret <vscale x 4 x half> %res
}

define <vscale x 2 x half> @fmsb_hx2(<vscale x 2 x half> %m1, <vscale x 2 x half> %m2, <vscale x 2 x half> %acc) {
; CHECK-LABEL: fmsb_hx2:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    fmsb z0.h, p0/m, z1.h, z2.h
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 2 x half> %m1, %m2
  %res = fsub contract <vscale x 2 x half> %acc, %mul
  ret <vscale x 2 x half> %res
}

define <vscale x 4 x float> @fmsb_s(<vscale x 4 x float> %m1, <vscale x 4 x float> %m2, <vscale x 4 x float> %acc) {
; CHECK-LABEL: fmsb_s:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    fmsb z0.s, p0/m, z1.s, z2.s
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 4 x float> %m1, %m2
  %res = fsub contract <vscale x 4 x float> %acc, %mul
  ret <vscale x 4 x float> %res
}

define <vscale x 2 x float> @fmsb_sx2(<vscale x 2 x float> %m1, <vscale x 2 x float> %m2, <vscale x 2 x float> %acc) {
; CHECK-LABEL: fmsb_sx2:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    fmsb z0.s, p0/m, z1.s, z2.s
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 2 x float> %m1, %m2
  %res = fsub contract <vscale x 2 x float> %acc, %mul
  ret <vscale x 2 x float> %res
}

define <vscale x 2 x double> @fmsb_d(<vscale x 2 x double> %m1, <vscale x 2 x double> %m2, <vscale x 2 x double> %acc) {
; CHECK-LABEL: fmsb_d:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    fmsb z0.d, p0/m, z1.d, z2.d
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 2 x double> %m1, %m2
  %res = fsub contract <vscale x 2 x double> %acc, %mul
  ret <vscale x 2 x double> %res
}

define <vscale x 8 x half> @fnmad_h(<vscale x 8 x half> %m1, <vscale x 8 x half> %m2, <vscale x 8 x half> %acc) {
; CHECK-LABEL: fnmad_h:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.h
; CHECK-NEXT:    fnmad z0.h, p0/m, z1.h, z2.h
; CHECK-NEXT:    ret
  %neg_m1 = fneg contract <vscale x 8 x half> %m1
  %mul = fmul contract <vscale x 8 x half> %neg_m1, %m2
  %res = fsub contract <vscale x 8 x half> %mul, %acc
  ret <vscale x 8 x half> %res
}

define <vscale x 4 x half> @fnmad_hx4(<vscale x 4 x half> %m1, <vscale x 4 x half> %m2, <vscale x 4 x half> %acc) {
; CHECK-LABEL: fnmad_hx4:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    fnmad z0.h, p0/m, z1.h, z2.h
; CHECK-NEXT:    ret
  %neg_m1 = fneg contract <vscale x 4 x half> %m1
  %mul = fmul contract <vscale x 4 x half> %neg_m1, %m2
  %res = fsub contract <vscale x 4 x half> %mul, %acc
  ret <vscale x 4 x half> %res
}

define <vscale x 2 x half> @fnmad_hx2(<vscale x 2 x half> %m1, <vscale x 2 x half> %m2, <vscale x 2 x half> %acc) {
; CHECK-LABEL: fnmad_hx2:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    fnmad z0.h, p0/m, z1.h, z2.h
; CHECK-NEXT:    ret
  %neg_m1 = fneg contract <vscale x 2 x half> %m1
  %mul = fmul contract <vscale x 2 x half> %neg_m1, %m2
  %res = fsub contract <vscale x 2 x half> %mul, %acc
  ret <vscale x 2 x half> %res
}

define <vscale x 4 x float> @fnmad_s(<vscale x 4 x float> %m1, <vscale x 4 x float> %m2, <vscale x 4 x float> %acc) {
; CHECK-LABEL: fnmad_s:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    fnmad z0.s, p0/m, z1.s, z2.s
; CHECK-NEXT:    ret
  %neg_m1 = fneg contract <vscale x 4 x float> %m1
  %mul = fmul contract <vscale x 4 x float> %neg_m1, %m2
  %res = fsub contract <vscale x 4 x float> %mul, %acc
  ret <vscale x 4 x float> %res
}

define <vscale x 2 x float> @fnmad_sx2(<vscale x 2 x float> %m1, <vscale x 2 x float> %m2, <vscale x 2 x float> %acc) {
; CHECK-LABEL: fnmad_sx2:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    fnmad z0.s, p0/m, z1.s, z2.s
; CHECK-NEXT:    ret
  %neg_m1 = fneg contract <vscale x 2 x float> %m1
  %mul = fmul contract <vscale x 2 x float> %neg_m1, %m2
  %res = fsub contract <vscale x 2 x float> %mul, %acc
  ret <vscale x 2 x float> %res
}

define <vscale x 2 x double> @fnmad_d(<vscale x 2 x double> %m1, <vscale x 2 x double> %m2, <vscale x 2 x double> %acc) {
; CHECK-LABEL: fnmad_d:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    fnmad z0.d, p0/m, z1.d, z2.d
; CHECK-NEXT:    ret
  %neg_m1 = fneg contract <vscale x 2 x double> %m1
  %mul = fmul contract <vscale x 2 x double> %neg_m1, %m2
  %res = fsub contract <vscale x 2 x double> %mul, %acc
  ret <vscale x 2 x double> %res
}

define <vscale x 8 x half> @fnmla_h(<vscale x 8 x half> %acc, <vscale x 8 x half> %m1, <vscale x 8 x half> %m2) {
; CHECK-LABEL: fnmla_h:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.h
; CHECK-NEXT:    fnmla z0.h, p0/m, z1.h, z2.h
; CHECK-NEXT:    ret
  %neg_m1 = fneg contract <vscale x 8 x half> %m1
  %mul = fmul contract <vscale x 8 x half> %neg_m1, %m2
  %res = fsub contract <vscale x 8 x half> %mul, %acc
  ret <vscale x 8 x half> %res
}

define <vscale x 4 x half> @fnmla_hx4(<vscale x 4 x half> %acc, <vscale x 4 x half> %m1, <vscale x 4 x half> %m2) {
; CHECK-LABEL: fnmla_hx4:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    fnmla z0.h, p0/m, z1.h, z2.h
; CHECK-NEXT:    ret
  %neg_m1 = fneg contract <vscale x 4 x half> %m1
  %mul = fmul contract <vscale x 4 x half> %neg_m1, %m2
  %res = fsub contract <vscale x 4 x half> %mul, %acc
  ret <vscale x 4 x half> %res
}

define <vscale x 2 x half> @fnmla_hx2(<vscale x 2 x half> %acc, <vscale x 2 x half> %m1, <vscale x 2 x half> %m2) {
; CHECK-LABEL: fnmla_hx2:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    fnmla z0.h, p0/m, z1.h, z2.h
; CHECK-NEXT:    ret
  %neg_m1 = fneg contract <vscale x 2 x half> %m1
  %mul = fmul contract <vscale x 2 x half> %neg_m1, %m2
  %res = fsub contract <vscale x 2 x half> %mul, %acc
  ret <vscale x 2 x half> %res
}

define <vscale x 4 x float> @fnmla_s(<vscale x 4 x float> %acc, <vscale x 4 x float> %m1, <vscale x 4 x float> %m2) {
; CHECK-LABEL: fnmla_s:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    fnmla z0.s, p0/m, z1.s, z2.s
; CHECK-NEXT:    ret
  %neg_m1 = fneg contract <vscale x 4 x float> %m1
  %mul = fmul contract <vscale x 4 x float> %neg_m1, %m2
  %res = fsub contract <vscale x 4 x float> %mul, %acc
  ret <vscale x 4 x float> %res
}

define <vscale x 2 x float> @fnmla_sx2(<vscale x 2 x float> %acc, <vscale x 2 x float> %m1, <vscale x 2 x float> %m2) {
; CHECK-LABEL: fnmla_sx2:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    fnmla z0.s, p0/m, z1.s, z2.s
; CHECK-NEXT:    ret
  %neg_m1 = fneg contract <vscale x 2 x float> %m1
  %mul = fmul contract <vscale x 2 x float> %neg_m1, %m2
  %res = fsub contract <vscale x 2 x float> %mul, %acc
  ret <vscale x 2 x float> %res
}

define <vscale x 2 x double> @fnmla_d(<vscale x 2 x double> %acc, <vscale x 2 x double> %m1, <vscale x 2 x double> %m2) {
; CHECK-LABEL: fnmla_d:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    fnmla z0.d, p0/m, z1.d, z2.d
; CHECK-NEXT:    ret
  %neg_m1 = fneg contract <vscale x 2 x double> %m1
  %mul = fmul contract <vscale x 2 x double> %neg_m1, %m2
  %res = fsub contract <vscale x 2 x double> %mul, %acc
  ret <vscale x 2 x double> %res
}

define <vscale x 8 x half> @fnmla_h_reversed(<vscale x 8 x half> %acc, <vscale x 8 x half> %m1, <vscale x 8 x half> %m2) {
; CHECK-LABEL: fnmla_h_reversed:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.h
; CHECK-NEXT:    fnmla z0.h, p0/m, z1.h, z2.h
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 8 x half> %m1, %m2
  %add = fadd contract <vscale x 8 x half> %mul, %acc
  %res = fneg contract nsz <vscale x 8 x half> %add
  ret <vscale x 8 x half> %res
}

define <vscale x 4 x half> @fnmla_hx4_reversed(<vscale x 4 x half> %acc, <vscale x 4 x half> %m1, <vscale x 4 x half> %m2) {
; CHECK-LABEL: fnmla_hx4_reversed:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    fnmla z0.h, p0/m, z1.h, z2.h
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 4 x half> %m1, %m2
  %add = fadd contract <vscale x 4 x half> %mul, %acc
  %res = fneg contract nsz <vscale x 4 x half> %add
  ret <vscale x 4 x half> %res
}

define <vscale x 2 x half> @fnmla_hx2_reversed(<vscale x 2 x half> %acc, <vscale x 2 x half> %m1, <vscale x 2 x half> %m2) {
; CHECK-LABEL: fnmla_hx2_reversed:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    fnmla z0.h, p0/m, z1.h, z2.h
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 2 x half> %m1, %m2
  %add = fadd contract <vscale x 2 x half> %mul, %acc
  %res = fneg contract nsz <vscale x 2 x half> %add
  ret <vscale x 2 x half> %res
}

define <vscale x 4 x float> @fnmla_s_reversed(<vscale x 4 x float> %acc, <vscale x 4 x float> %m1, <vscale x 4 x float> %m2) {
; CHECK-LABEL: fnmla_s_reversed:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    fnmla z0.s, p0/m, z1.s, z2.s
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 4 x float> %m1, %m2
  %add = fadd contract <vscale x 4 x float> %mul, %acc
  %res = fneg contract nsz <vscale x 4 x float> %add
  ret <vscale x 4 x float> %res
}

define <vscale x 2 x float> @fnmla_sx2_reversed(<vscale x 2 x float> %acc, <vscale x 2 x float> %m1, <vscale x 2 x float> %m2) {
; CHECK-LABEL: fnmla_sx2_reversed:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    fnmla z0.s, p0/m, z1.s, z2.s
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 2 x float> %m1, %m2
  %add = fadd contract <vscale x 2 x float> %mul, %acc
  %res = fneg contract nsz <vscale x 2 x float> %add
  ret <vscale x 2 x float> %res
}

define <vscale x 2 x double> @fnmla_d_reversed(<vscale x 2 x double> %acc, <vscale x 2 x double> %m1, <vscale x 2 x double> %m2) {
; CHECK-LABEL: fnmla_d_reversed:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    fnmla z0.d, p0/m, z1.d, z2.d
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 2 x double> %m1, %m2
  %add = fadd contract <vscale x 2 x double> %mul, %acc
  %res = fneg contract nsz <vscale x 2 x double> %add
  ret <vscale x 2 x double> %res
}

define <vscale x 8 x half> @signed_zeros_negtest_fnmla_h_reversed(<vscale x 8 x half> %acc, <vscale x 8 x half> %m1, <vscale x 8 x half> %m2) {
; CHECK-LABEL: signed_zeros_negtest_fnmla_h_reversed:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.h
; CHECK-NEXT:    fmla z0.h, p0/m, z1.h, z2.h
; CHECK-NEXT:    fneg z0.h, p0/m, z0.h
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 8 x half> %m1, %m2
  %add = fadd contract <vscale x 8 x half> %mul, %acc
  %res = fneg contract <vscale x 8 x half> %add
  ret <vscale x 8 x half> %res
}

define <vscale x 4 x half> @signed_zeros_negtest_fnmla_hx4_reversed(<vscale x 4 x half> %acc, <vscale x 4 x half> %m1, <vscale x 4 x half> %m2) {
; CHECK-LABEL: signed_zeros_negtest_fnmla_hx4_reversed:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    fmla z0.h, p0/m, z1.h, z2.h
; CHECK-NEXT:    fneg z0.h, p0/m, z0.h
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 4 x half> %m1, %m2
  %add = fadd contract <vscale x 4 x half> %mul, %acc
  %res = fneg contract <vscale x 4 x half> %add
  ret <vscale x 4 x half> %res
}

define <vscale x 2 x half> @signed_zeros_negtest_fnmla_hx2_reversed(<vscale x 2 x half> %acc, <vscale x 2 x half> %m1, <vscale x 2 x half> %m2) {
; CHECK-LABEL: signed_zeros_negtest_fnmla_hx2_reversed:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    fmla z0.h, p0/m, z1.h, z2.h
; CHECK-NEXT:    fneg z0.h, p0/m, z0.h
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 2 x half> %m1, %m2
  %add = fadd contract <vscale x 2 x half> %mul, %acc
  %res = fneg contract <vscale x 2 x half> %add
  ret <vscale x 2 x half> %res
}

define <vscale x 4 x float> @signed_zeros_negtest_fnmla_s_reversed(<vscale x 4 x float> %acc, <vscale x 4 x float> %m1, <vscale x 4 x float> %m2) {
; CHECK-LABEL: signed_zeros_negtest_fnmla_s_reversed:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    fmla z0.s, p0/m, z1.s, z2.s
; CHECK-NEXT:    fneg z0.s, p0/m, z0.s
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 4 x float> %m1, %m2
  %add = fadd contract <vscale x 4 x float> %mul, %acc
  %res = fneg contract <vscale x 4 x float> %add
  ret <vscale x 4 x float> %res
}

define <vscale x 2 x float> @signed_zeros_negtest_fnmla_sx2_reversed(<vscale x 2 x float> %acc, <vscale x 2 x float> %m1, <vscale x 2 x float> %m2) {
; CHECK-LABEL: signed_zeros_negtest_fnmla_sx2_reversed:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    fmla z0.s, p0/m, z1.s, z2.s
; CHECK-NEXT:    fneg z0.s, p0/m, z0.s
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 2 x float> %m1, %m2
  %add = fadd contract <vscale x 2 x float> %mul, %acc
  %res = fneg contract <vscale x 2 x float> %add
  ret <vscale x 2 x float> %res
}

define <vscale x 2 x double> @signed_zeros_negtest_fnmla_d_reversed(<vscale x 2 x double> %acc, <vscale x 2 x double> %m1, <vscale x 2 x double> %m2) {
; CHECK-LABEL: signed_zeros_negtest_fnmla_d_reversed:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    fmla z0.d, p0/m, z1.d, z2.d
; CHECK-NEXT:    fneg z0.d, p0/m, z0.d
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 2 x double> %m1, %m2
  %add = fadd contract <vscale x 2 x double> %mul, %acc
  %res = fneg contract <vscale x 2 x double> %add
  ret <vscale x 2 x double> %res
}

define <vscale x 8 x half> @fnmls_h(<vscale x 8 x half> %acc, <vscale x 8 x half> %m1, <vscale x 8 x half> %m2) {
; CHECK-LABEL: fnmls_h:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.h
; CHECK-NEXT:    fnmls z0.h, p0/m, z1.h, z2.h
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 8 x half> %m1, %m2
  %res = fsub contract <vscale x 8 x half> %mul, %acc
  ret <vscale x 8 x half> %res
}

define <vscale x 4 x half> @fnmls_hx4(<vscale x 4 x half> %acc, <vscale x 4 x half> %m1, <vscale x 4 x half> %m2) {
; CHECK-LABEL: fnmls_hx4:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    fnmls z0.h, p0/m, z1.h, z2.h
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 4 x half> %m1, %m2
  %res = fsub contract <vscale x 4 x half> %mul, %acc
  ret <vscale x 4 x half> %res
}

define <vscale x 2 x half> @fnmls_hx2(<vscale x 2 x half> %acc, <vscale x 2 x half> %m1, <vscale x 2 x half> %m2) {
; CHECK-LABEL: fnmls_hx2:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    fnmls z0.h, p0/m, z1.h, z2.h
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 2 x half> %m1, %m2
  %res = fsub contract <vscale x 2 x half> %mul, %acc
  ret <vscale x 2 x half> %res
}

define <vscale x 4 x float> @fnmls_s(<vscale x 4 x float> %acc, <vscale x 4 x float> %m1, <vscale x 4 x float> %m2) {
; CHECK-LABEL: fnmls_s:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    fnmls z0.s, p0/m, z1.s, z2.s
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 4 x float> %m1, %m2
  %res = fsub contract <vscale x 4 x float> %mul, %acc
  ret <vscale x 4 x float> %res
}

define <vscale x 2 x float> @fnmls_sx2(<vscale x 2 x float> %acc, <vscale x 2 x float> %m1, <vscale x 2 x float> %m2) {
; CHECK-LABEL: fnmls_sx2:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    fnmls z0.s, p0/m, z1.s, z2.s
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 2 x float> %m1, %m2
  %res = fsub contract <vscale x 2 x float> %mul, %acc
  ret <vscale x 2 x float> %res
}

define <vscale x 2 x double> @fnmls_d(<vscale x 2 x double> %acc, <vscale x 2 x double> %m1, <vscale x 2 x double> %m2) {
; CHECK-LABEL: fnmls_d:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    fnmls z0.d, p0/m, z1.d, z2.d
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 2 x double> %m1, %m2
  %res = fsub contract <vscale x 2 x double> %mul, %acc
  ret <vscale x 2 x double> %res
}

define <vscale x 8 x half> @fnmsb_h(<vscale x 8 x half> %m1, <vscale x 8 x half> %m2, <vscale x 8 x half> %acc) {
; CHECK-LABEL: fnmsb_h:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.h
; CHECK-NEXT:    fnmsb z0.h, p0/m, z1.h, z2.h
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 8 x half> %m1, %m2
  %res = fsub contract <vscale x 8 x half> %mul, %acc
  ret <vscale x 8 x half> %res
}

define <vscale x 4 x half> @fnmsb_hx4(<vscale x 4 x half> %m1, <vscale x 4 x half> %m2, <vscale x 4 x half> %acc) {
; CHECK-LABEL: fnmsb_hx4:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    fnmsb z0.h, p0/m, z1.h, z2.h
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 4 x half> %m1, %m2
  %res = fsub contract <vscale x 4 x half> %mul, %acc
  ret <vscale x 4 x half> %res
}

define <vscale x 2 x half> @fnmsb_hx2(<vscale x 2 x half> %m1, <vscale x 2 x half> %m2, <vscale x 2 x half> %acc) {
; CHECK-LABEL: fnmsb_hx2:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    fnmsb z0.h, p0/m, z1.h, z2.h
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 2 x half> %m1, %m2
  %res = fsub contract <vscale x 2 x half> %mul, %acc
  ret <vscale x 2 x half> %res
}

define <vscale x 4 x float> @fnmsb_s(<vscale x 4 x float> %m1, <vscale x 4 x float> %m2, <vscale x 4 x float> %acc) {
; CHECK-LABEL: fnmsb_s:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    fnmsb z0.s, p0/m, z1.s, z2.s
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 4 x float> %m1, %m2
  %res = fsub contract <vscale x 4 x float> %mul, %acc
  ret <vscale x 4 x float> %res
}

define <vscale x 2 x float> @fnmsb_sx2(<vscale x 2 x float> %m1, <vscale x 2 x float> %m2, <vscale x 2 x float> %acc) {
; CHECK-LABEL: fnmsb_sx2:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    fnmsb z0.s, p0/m, z1.s, z2.s
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 2 x float> %m1, %m2
  %res = fsub contract <vscale x 2 x float> %mul, %acc
  ret <vscale x 2 x float> %res
}

define <vscale x 2 x double> @fnmsb_d(<vscale x 2 x double> %m1, <vscale x 2 x double> %m2, <vscale x 2 x double> %acc) {
; CHECK-LABEL: fnmsb_d:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    fnmsb z0.d, p0/m, z1.d, z2.d
; CHECK-NEXT:    ret
  %mul = fmul contract <vscale x 2 x double> %m1, %m2
  %res = fsub contract <vscale x 2 x double> %mul, %acc
  ret <vscale x 2 x double> %res
}

define <vscale x 8 x half> @fadd_h_sel(<vscale x 8 x half> %a, <vscale x 8 x half> %b, <vscale x 8 x i1> %mask) {
; CHECK-LABEL: fadd_h_sel:
; CHECK:       // %bb.0:
; CHECK-NEXT:    fadd z0.h, p0/m, z0.h, z1.h
; CHECK-NEXT:    ret
  %sel = select <vscale x 8 x i1> %mask, <vscale x 8 x half> %b, <vscale x 8 x half> zeroinitializer
  %fadd = fadd nsz <vscale x 8 x half> %a, %sel
  ret <vscale x 8 x half> %fadd
}

define <vscale x 4 x float> @fadd_s_sel(<vscale x 4 x float> %a, <vscale x 4 x float> %b, <vscale x 4 x i1> %mask) {
; CHECK-LABEL: fadd_s_sel:
; CHECK:       // %bb.0:
; CHECK-NEXT:    fadd z0.s, p0/m, z0.s, z1.s
; CHECK-NEXT:    ret
  %sel = select <vscale x 4 x i1> %mask, <vscale x 4 x float> %b, <vscale x 4 x float> zeroinitializer
  %fadd = fadd nsz <vscale x 4 x float> %a, %sel
  ret <vscale x 4 x float> %fadd
}

define <vscale x 2 x double> @fadd_d_sel(<vscale x 2 x double> %a, <vscale x 2 x double> %b, <vscale x 2 x i1> %mask) {
; CHECK-LABEL: fadd_d_sel:
; CHECK:       // %bb.0:
; CHECK-NEXT:    fadd z0.d, p0/m, z0.d, z1.d
; CHECK-NEXT:    ret
  %sel = select <vscale x 2 x i1> %mask, <vscale x 2 x double> %b, <vscale x 2 x double> zeroinitializer
  %fadd = fadd nsz <vscale x 2 x double> %a, %sel
  ret <vscale x 2 x double> %fadd
}

define <vscale x 8 x half> @fsub_h_sel(<vscale x 8 x half> %a, <vscale x 8 x half> %b, <vscale x 8 x i1> %mask) {
; CHECK-LABEL: fsub_h_sel:
; CHECK:       // %bb.0:
; CHECK-NEXT:    fsub z0.h, p0/m, z0.h, z1.h
; CHECK-NEXT:    ret
  %sel = select <vscale x 8 x i1> %mask, <vscale x 8 x half> %b, <vscale x 8 x half> zeroinitializer
  %fsub = fsub <vscale x 8 x half> %a, %sel
  ret <vscale x 8 x half> %fsub
}

define <vscale x 4 x float> @fsub_s_sel(<vscale x 4 x float> %a, <vscale x 4 x float> %b, <vscale x 4 x i1> %mask) {
; CHECK-LABEL: fsub_s_sel:
; CHECK:       // %bb.0:
; CHECK-NEXT:    fsub z0.s, p0/m, z0.s, z1.s
; CHECK-NEXT:    ret
  %sel = select <vscale x 4 x i1> %mask, <vscale x 4 x float> %b, <vscale x 4 x float> zeroinitializer
  %fsub = fsub <vscale x 4 x float> %a, %sel
  ret <vscale x 4 x float> %fsub
}

define <vscale x 2 x double> @fsub_d_sel(<vscale x 2 x double> %a, <vscale x 2 x double> %b, <vscale x 2 x i1> %mask) {
; CHECK-LABEL: fsub_d_sel:
; CHECK:       // %bb.0:
; CHECK-NEXT:    fsub z0.d, p0/m, z0.d, z1.d
; CHECK-NEXT:    ret
  %sel = select <vscale x 2 x i1> %mask, <vscale x 2 x double> %b, <vscale x 2 x double> zeroinitializer
  %fsub = fsub <vscale x 2 x double> %a, %sel
  ret <vscale x 2 x double> %fsub
}

define <vscale x 8 x half> @fadd_sel_fmul_h(<vscale x 8 x half> %a, <vscale x 8 x half> %b, <vscale x 8 x half> %c, <vscale x 8 x i1> %mask) {
; CHECK-LABEL: fadd_sel_fmul_h:
; CHECK:       // %bb.0:
; CHECK-NEXT:    fmla z0.h, p0/m, z1.h, z2.h
; CHECK-NEXT:    ret
  %fmul = fmul <vscale x 8 x half> %b, %c
  %sel = select <vscale x 8 x i1> %mask, <vscale x 8 x half> %fmul, <vscale x 8 x half> zeroinitializer
  %fadd = fadd nsz contract <vscale x 8 x half> %a, %sel
  ret <vscale x 8 x half> %fadd
}

define <vscale x 4 x float> @fadd_sel_fmul_s(<vscale x 4 x float> %a, <vscale x 4 x float> %b, <vscale x 4 x float> %c, <vscale x 4 x i1> %mask) {
; CHECK-LABEL: fadd_sel_fmul_s:
; CHECK:       // %bb.0:
; CHECK-NEXT:    fmla z0.s, p0/m, z1.s, z2.s
; CHECK-NEXT:    ret
  %fmul = fmul <vscale x 4 x float> %b, %c
  %sel = select <vscale x 4 x i1> %mask, <vscale x 4 x float> %fmul, <vscale x 4 x float> zeroinitializer
  %fadd = fadd nsz contract <vscale x 4 x float> %a, %sel
  ret <vscale x 4 x float> %fadd
}

define <vscale x 2 x double> @fadd_sel_fmul_d(<vscale x 2 x double> %a, <vscale x 2 x double> %b, <vscale x 2 x double> %c, <vscale x 2 x i1> %mask) {
; CHECK-LABEL: fadd_sel_fmul_d:
; CHECK:       // %bb.0:
; CHECK-NEXT:    fmla z0.d, p0/m, z1.d, z2.d
; CHECK-NEXT:    ret
  %fmul = fmul <vscale x 2 x double> %b, %c
  %sel = select <vscale x 2 x i1> %mask, <vscale x 2 x double> %fmul, <vscale x 2 x double> zeroinitializer
  %fadd = fadd nsz contract <vscale x 2 x double> %a, %sel
  ret <vscale x 2 x double> %fadd
}

define <vscale x 8 x half> @fsub_sel_fmul_h(<vscale x 8 x half> %a, <vscale x 8 x half> %b, <vscale x 8 x half> %c, <vscale x 8 x i1> %mask) {
; CHECK-LABEL: fsub_sel_fmul_h:
; CHECK:       // %bb.0:
; CHECK-NEXT:    fmls z0.h, p0/m, z1.h, z2.h
; CHECK-NEXT:    ret
  %fmul = fmul <vscale x 8 x half> %b, %c
  %sel = select <vscale x 8 x i1> %mask, <vscale x 8 x half> %fmul, <vscale x 8 x half> zeroinitializer
  %fsub = fsub contract <vscale x 8 x half> %a, %sel
  ret <vscale x 8 x half> %fsub
}

define <vscale x 4 x float> @fsub_sel_fmul_s(<vscale x 4 x float> %a, <vscale x 4 x float> %b, <vscale x 4 x float> %c, <vscale x 4 x i1> %mask) {
; CHECK-LABEL: fsub_sel_fmul_s:
; CHECK:       // %bb.0:
; CHECK-NEXT:    fmls z0.s, p0/m, z1.s, z2.s
; CHECK-NEXT:    ret
  %fmul = fmul <vscale x 4 x float> %b, %c
  %sel = select <vscale x 4 x i1> %mask, <vscale x 4 x float> %fmul, <vscale x 4 x float> zeroinitializer
  %fsub = fsub contract <vscale x 4 x float> %a, %sel
  ret <vscale x 4 x float> %fsub
}

define <vscale x 2 x double> @fsub_sel_fmul_d(<vscale x 2 x double> %a, <vscale x 2 x double> %b, <vscale x 2 x double> %c, <vscale x 2 x i1> %mask) {
; CHECK-LABEL: fsub_sel_fmul_d:
; CHECK:       // %bb.0:
; CHECK-NEXT:    fmls z0.d, p0/m, z1.d, z2.d
; CHECK-NEXT:    ret
  %fmul = fmul <vscale x 2 x double> %b, %c
  %sel = select <vscale x 2 x i1> %mask, <vscale x 2 x double> %fmul, <vscale x 2 x double> zeroinitializer
  %fsub = fsub contract <vscale x 2 x double> %a, %sel
  ret <vscale x 2 x double> %fsub
}

; Verify combine requires contract fast-math flag.
define <vscale x 4 x float> @fadd_sel_fmul_no_contract_s(<vscale x 4 x float> %a, <vscale x 4 x float> %b, <vscale x 4 x float> %c, <vscale x 4 x i1> %mask) {
; CHECK-LABEL: fadd_sel_fmul_no_contract_s:
; CHECK:       // %bb.0:
; CHECK-NEXT:    fmul z1.s, z1.s, z2.s
; CHECK-NEXT:    fadd z0.s, p0/m, z0.s, z1.s
; CHECK-NEXT:    ret
  %fmul = fmul <vscale x 4 x float> %b, %c
  %sel = select <vscale x 4 x i1> %mask, <vscale x 4 x float> %fmul, <vscale x 4 x float> zeroinitializer
  %fadd = fadd nsz <vscale x 4 x float> %a, %sel
  ret <vscale x 4 x float> %fadd
}

; Verify combine requires no-signed zeros fast-math flag.
define <vscale x 4 x float> @fadd_sel_fmul_no_nsz_s(<vscale x 4 x float> %a, <vscale x 4 x float> %b, <vscale x 4 x float> %c, <vscale x 4 x i1> %mask) {
; CHECK-LABEL: fadd_sel_fmul_no_nsz_s:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov z3.s, #0 // =0x0
; CHECK-NEXT:    fmul z1.s, z1.s, z2.s
; CHECK-NEXT:    sel z1.s, p0, z1.s, z3.s
; CHECK-NEXT:    fadd z0.s, z0.s, z1.s
; CHECK-NEXT:    ret
  %fmul = fmul <vscale x 4 x float> %b, %c
  %sel = select <vscale x 4 x i1> %mask, <vscale x 4 x float> %fmul, <vscale x 4 x float> zeroinitializer
  %fadd = fadd contract <vscale x 4 x float> %a, %sel
  ret <vscale x 4 x float> %fadd
}