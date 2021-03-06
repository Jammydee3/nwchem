      SUBROUTINE eomccsdtq_y4(d_f1,d_i0,d_t1,d_t2,d_v2,d_y2,d_y3,d_y4,k_
     &f1_offset,k_i0_offset,k_t1_offset,k_t2_offset,k_v2_offset,k_y2_off
     &set,k_y3_offset,k_y4_offset)
C     $Id$
C     This is a Fortran77 program generated by Tensor Contraction Engine v.1.0
C     Copyright (c) Battelle & Pacific Northwest National Laboratory (2002)
C     i0 ( h5 h6 h7 h8 p1 p2 p3 p4 )_yv + = 1 * P( 36 ) * y ( h5 h6 p1 p2 )_y * v ( h7 h8 p3 p4 )_v
C     i0 ( h5 h6 h7 h8 p1 p2 p3 p4 )_yf + = 1 * P( 16 ) * y ( h5 h6 h7 p1 p2 p3 )_y * i1 ( h8 p4 )_f
C         i1 ( h5 p1 )_f + = 1 * f ( h5 p1 )_f
C         i1 ( h5 p1 )_vt + = 1 * Sum ( h10 p9 ) * t ( p9 h10 )_t * v ( h5 h10 p1 p9 )_v
C     i0 ( h5 h6 h7 h8 p1 p2 p3 p4 )_yv + = -1 * P( 24 ) * Sum ( h11 ) * y ( h5 h6 h11 p1 p2 p3 )_y * i1 ( h7 h8 h11 p4 )_v
C         i1 ( h5 h6 h11 p1 )_v + = 1 * v ( h5 h6 h11 p1 )_v
C         i1 ( h5 h6 h11 p1 )_vt + = -1 * Sum ( p9 ) * t ( p9 h11 )_t * v ( h5 h6 p1 p9 )_v
C     i0 ( h5 h6 h7 h8 p1 p2 p3 p4 )_yv + = -1 * P( 24 ) * Sum ( p9 ) * y ( h5 h6 h7 p1 p2 p9 )_y * v ( h8 p9 p3 p4 )_v
C     i0 ( h5 h6 h7 h8 p1 p2 p3 p4 )_yf + = -1 * P( 4 ) * Sum ( h13 ) * y ( h5 h6 h7 h13 p1 p2 p3 p4 )_y * i1 ( h8 h13 )_f
C         i1 ( h5 h13 )_f + = 1 * f ( h5 h13 )_f
C         i1 ( h5 h13 )_ft + = 1 * Sum ( p9 ) * t ( p9 h13 )_t * i2 ( h5 p9 )_f
C             i2 ( h5 p9 )_f + = 1 * f ( h5 p9 )_f
C             i2 ( h5 p9 )_vt + = 1 * Sum ( h12 p11 ) * t ( p11 h12 )_t * v ( h5 h12 p9 p11 )_v
C         i1 ( h5 h13 )_vt + = 1 * Sum ( h10 p9 ) * t ( p9 h10 )_t * v ( h5 h10 h13 p9 )_v
C         i1 ( h5 h13 )_vt + = -1/2 * Sum ( h12 p9 p10 ) * t ( p9 p10 h12 h13 )_t * v ( h5 h12 p9 p10 )_v
C     i0 ( h5 h6 h7 h8 p1 p2 p3 p4 )_yf + = 1 * P( 4 ) * Sum ( p14 ) * y ( h5 h6 h7 h8 p1 p2 p3 p14 )_y * i1 ( p14 p4 )_f
C         i1 ( p14 p1 )_f + = 1 * f ( p14 p1 )_f
C         i1 ( p14 p1 )_vt + = -1 * Sum ( h10 p9 ) * t ( p9 h10 )_t * v ( h10 p14 p1 p9 )_v
C         i1 ( p14 p1 )_vt + = 1/2 * Sum ( h11 h12 p10 ) * t ( p10 p14 h11 h12 )_t * v ( h11 h12 p1 p10 )_v
C         i1 ( p14 p1 )_vtt + = -1 * Sum ( h10 ) * t ( p14 h10 )_t * i2 ( h10 p1 )_vt
C             i2 ( h10 p1 )_vt + = 1 * Sum ( h12 p11 ) * t ( p11 h12 )_t * v ( h10 h12 p1 p11 )_v
C     i0 ( h5 h6 h7 h8 p1 p2 p3 p4 )_yv + = 1/2 * P( 6 ) * Sum ( h14 h13 ) * y ( h5 h6 h13 h14 p1 p2 p3 p4 )_y * i1 ( h7 h8 h13 h14 )_v
C         i1 ( h5 h6 h13 h14 )_v + = 1 * v ( h5 h6 h13 h14 )_v
C         i1 ( h5 h6 h13 h14 )_vt + = -2 * Sum ( p9 ) * t ( p9 h13 )_t * i2 ( h5 h6 h14 p9 )_v
C             i2 ( h5 h6 h14 p9 )_v + = 1 * v ( h5 h6 h14 p9 )_v
C             i2 ( h5 h6 h14 p9 )_vt + = -1/2 * Sum ( p11 ) * t ( p11 h14 )_t * v ( h5 h6 p9 p11 )_v
C         i1 ( h5 h6 h13 h14 )_vt + = 1/2 * Sum ( p9 p10 ) * t ( p9 p10 h13 h14 )_t * v ( h5 h6 p9 p10 )_v
C     i0 ( h5 h6 h7 h8 p1 p2 p3 p4 )_yv + = -1 * P( 16 ) * Sum ( h14 p11 ) * y ( h5 h6 h7 h14 p1 p2 p3 p11 )_y * i1 ( h8 p11 h14 p4 )_v
C         i1 ( h5 p11 h14 p1 )_v + = 1 * v ( h5 p11 h14 p1 )_v
C         i1 ( h5 p11 h14 p1 )_vt + = -1 * Sum ( p9 ) * t ( p9 h14 )_t * v ( h5 p11 p1 p9 )_v
C         i1 ( h5 p11 h14 p1 )_vt + = -1 * Sum ( h12 p10 ) * t ( p10 p11 h12 h14 )_t * v ( h5 h12 p1 p10 )_v
C         i1 ( h5 p11 h14 p1 )_vtt + = 1 * Sum ( h12 ) * t ( p11 h12 )_t * i2 ( h5 h12 h14 p1 )_vt
C             i2 ( h5 h12 h14 p1 )_vt + = 1 * Sum ( p9 ) * t ( p9 h14 )_t * v ( h5 h12 p1 p9 )_v
C     i0 ( h5 h6 h7 h8 p1 p2 p3 p4 )_yv + = 1/2 * P( 6 ) * Sum ( p10 p9 ) * y ( h5 h6 h7 h8 p1 p2 p9 p10 )_y * v ( p9 p10 p3 p4 )_v
C     i0 ( h5 h6 h7 h8 p1 p2 p3 p4 )_ytv + = 1 * P( 24 ) * Sum ( h13 ) * i1 ( h5 h6 h7 h13 p1 p2 )_yt * v ( h8 h13 p3 p4 )_v
C         i1 ( h5 h6 h7 h13 p1 p2 )_yt + = 1 * Sum ( p9 ) * t ( p9 h13 )_t * y ( h5 h6 h7 p1 p2 p9 )_y
C         i1 ( h5 h6 h7 h13 p1 p2 )_yt + = -1/2 * Sum ( h11 p10 p9 ) * t ( p9 p10 h11 h13 )_t * y ( h5 h6 h7 h11 p1 p2 p9 p10 )_y
C     i0 ( h5 h6 h7 h8 p1 p2 p3 p4 )_ytf + = 1 * P( 4 ) * Sum ( h9 ) * i1 ( h5 h6 h7 h8 h9 p1 p2 p3 )_yt * f ( h9 p4 )_f
C         i1 ( h5 h6 h7 h8 h9 p1 p2 p3 )_yt + = -1 * Sum ( p10 ) * t ( p10 h9 )_t * y ( h5 h6 h7 h8 p1 p2 p3 p10 )_y
C     i0 ( h5 h6 h7 h8 p1 p2 p3 p4 )_ytv + = 1 * P( 16 ) * Sum ( h11 h10 ) * i1 ( h5 h6 h7 h11 h10 p1 p2 p3 )_yt * v ( h8 h10 h11 p4 )_v
C         i1 ( h5 h6 h7 h11 h10 p1 p2 p3 )_yt + = 1 * Sum ( p9 ) * t ( p9 h10 )_t * y ( h5 h6 h7 h11 p1 p2 p3 p9 )_y
C     i0 ( h5 h6 h7 h8 p1 p2 p3 p4 )_ytv + = 1 * P( 6 ) * Sum ( h10 p11 ) * i1 ( h5 h6 h7 h8 h10 p1 p2 p11 )_yt * v ( h10 p11 p3 p4 )_v
C         i1 ( h5 h6 h7 h8 h10 p1 p2 p11 )_yt + = -1 * Sum ( p9 ) * t ( p9 h10 )_t * y ( h5 h6 h7 h8 p1 p2 p9 p11 )_y
C     i0 ( h5 h6 h7 h8 p1 p2 p3 p4 )_ytv + = -1/2 * P( 24 ) * Sum ( p10 ) * i1 ( h5 h6 p10 p1 p2 p3 )_yt * v ( h7 h8 p4 p10 )_v
C         i1 ( h5 h6 p10 p1 p2 p3 )_yt + = 1 * Sum ( h12 h11 p9 ) * t ( p9 p10 h11 h12 )_t * y ( h5 h6 h11 h12 p1 p2 p3 p9 )_y
C     i0 ( h5 h6 h7 h8 p1 p2 p3 p4 )_ytv + = 1/4 * P( 6 ) * Sum ( h13 h12 ) * i1 ( h5 h6 h7 h8 h12 h13 p1 p2 )_yt * v ( h12 h13 p3 p4 )_v
C         i1 ( h5 h6 h7 h8 h12 h13 p1 p2 )_yt + = 1 * Sum ( p10 p9 ) * t ( p9 p10 h12 h13 )_t * y ( h5 h6 h7 h8 p1 p2 p9 p10 )_y
C         i1 ( h5 h6 h7 h8 h12 h13 p1 p2 )_ytt + = 2 * Sum ( p9 ) * t ( p9 h13 )_t * i2 ( h5 h6 h7 h8 h12 p1 p2 p9 )_yt
C             i2 ( h5 h6 h7 h8 h12 p1 p2 p9 )_yt + = -1 * Sum ( p11 ) * t ( p11 h12 )_t * y ( h5 h6 h7 h8 p1 p2 p9 p11 )_y
      IMPLICIT NONE
#include "global.fh"
#include "mafdecls.fh"
#include "util.fh"
#include "errquit.fh"
#include "tce.fh"
      INTEGER d_i0
      INTEGER k_i0_offset
      INTEGER d_y2
      INTEGER k_y2_offset
      INTEGER d_v2
      INTEGER k_v2_offset
      INTEGER d_y3
      INTEGER k_y3_offset
      INTEGER d_i1
      INTEGER k_i1_offset
      INTEGER d_y4
      INTEGER k_y4_offset
      INTEGER d_f1
      INTEGER k_f1_offset
      INTEGER l_i1_offset
      INTEGER size_i1
      INTEGER d_t1
      INTEGER k_t1_offset
      INTEGER d_i2
      INTEGER k_i2_offset
      INTEGER d_t2
      INTEGER k_t2_offset
      INTEGER l_i2_offset
      INTEGER size_i2
      CHARACTER*255 filename
c#if !defined(CCSDTQ)
c      CALL ERRQUIT('CCSDTQ not compiled',0,CAPMIS_ERR)
c      RETURN
c      END
c#else
      CALL eomccsdtq_y4_1(d_y2,k_y2_offset,d_v2,k_v2_offset,d_i0,k_i0_of
     &fset)
      CALL OFFSET_eomccsdtq_y4_2_1(l_i1_offset,k_i1_offset,size_i1)
      CALL TCE_FILENAME('eomccsdtq_y4_2_1_i1',filename)
      CALL CREATEFILE(filename,d_i1,size_i1)
      CALL eomccsdtq_y4_2_1(d_f1,k_f1_offset,d_i1,k_i1_offset)
      CALL eomccsdtq_y4_2_2(d_t1,k_t1_offset,d_v2,k_v2_offset,d_i1,k_i1_
     &offset)
      CALL RECONCILEFILE(d_i1,size_i1)
      CALL eomccsdtq_y4_2(d_y3,k_y3_offset,d_i1,k_i1_offset,d_i0,k_i0_of
     &fset)
      CALL DELETEFILE(d_i1)
      IF (.not.MA_POP_STACK(l_i1_offset)) CALL ERRQUIT('eomccsdtq_y4',-1
     &,MA_ERR)
      CALL OFFSET_eomccsdtq_y4_3_1(l_i1_offset,k_i1_offset,size_i1)
      CALL TCE_FILENAME('eomccsdtq_y4_3_1_i1',filename)
      CALL CREATEFILE(filename,d_i1,size_i1)
      CALL eomccsdtq_y4_3_1(d_v2,k_v2_offset,d_i1,k_i1_offset)
      CALL eomccsdtq_y4_3_2(d_t1,k_t1_offset,d_v2,k_v2_offset,d_i1,k_i1_
     &offset)
      CALL RECONCILEFILE(d_i1,size_i1)
      CALL eomccsdtq_y4_3(d_y3,k_y3_offset,d_i1,k_i1_offset,d_i0,k_i0_of
     &fset)
      CALL DELETEFILE(d_i1)
      IF (.not.MA_POP_STACK(l_i1_offset)) CALL ERRQUIT('eomccsdtq_y4',-1
     &,MA_ERR)
      CALL eomccsdtq_y4_4(d_y3,k_y3_offset,d_v2,k_v2_offset,d_i0,k_i0_of
     &fset)
      CALL OFFSET_eomccsdtq_y4_5_1(l_i1_offset,k_i1_offset,size_i1)
      CALL TCE_FILENAME('eomccsdtq_y4_5_1_i1',filename)
      CALL CREATEFILE(filename,d_i1,size_i1)
      CALL eomccsdtq_y4_5_1(d_f1,k_f1_offset,d_i1,k_i1_offset)
      CALL OFFSET_eomccsdtq_y4_5_2_1(l_i2_offset,k_i2_offset,size_i2)
      CALL TCE_FILENAME('eomccsdtq_y4_5_2_1_i2',filename)
      CALL CREATEFILE(filename,d_i2,size_i2)
      CALL eomccsdtq_y4_5_2_1(d_f1,k_f1_offset,d_i2,k_i2_offset)
      CALL eomccsdtq_y4_5_2_2(d_t1,k_t1_offset,d_v2,k_v2_offset,d_i2,k_i
     &2_offset)
      CALL RECONCILEFILE(d_i2,size_i2)
      CALL eomccsdtq_y4_5_2(d_t1,k_t1_offset,d_i2,k_i2_offset,d_i1,k_i1_
     &offset)
      CALL DELETEFILE(d_i2)
      IF (.not.MA_POP_STACK(l_i2_offset)) CALL ERRQUIT('eomccsdtq_y4',-1
     &,MA_ERR)
      CALL eomccsdtq_y4_5_3(d_t1,k_t1_offset,d_v2,k_v2_offset,d_i1,k_i1_
     &offset)
      CALL eomccsdtq_y4_5_4(d_t2,k_t2_offset,d_v2,k_v2_offset,d_i1,k_i1_
     &offset)
      CALL RECONCILEFILE(d_i1,size_i1)
      CALL eomccsdtq_y4_5(d_y4,k_y4_offset,d_i1,k_i1_offset,d_i0,k_i0_of
     &fset)
      CALL DELETEFILE(d_i1)
      IF (.not.MA_POP_STACK(l_i1_offset)) CALL ERRQUIT('eomccsdtq_y4',-1
     &,MA_ERR)
      CALL OFFSET_eomccsdtq_y4_6_1(l_i1_offset,k_i1_offset,size_i1)
      CALL TCE_FILENAME('eomccsdtq_y4_6_1_i1',filename)
      CALL CREATEFILE(filename,d_i1,size_i1)
      CALL eomccsdtq_y4_6_1(d_f1,k_f1_offset,d_i1,k_i1_offset)
      CALL eomccsdtq_y4_6_2(d_t1,k_t1_offset,d_v2,k_v2_offset,d_i1,k_i1_
     &offset)
      CALL eomccsdtq_y4_6_3(d_t2,k_t2_offset,d_v2,k_v2_offset,d_i1,k_i1_
     &offset)
      CALL OFFSET_eomccsdtq_y4_6_4_1(l_i2_offset,k_i2_offset,size_i2)
      CALL TCE_FILENAME('eomccsdtq_y4_6_4_1_i2',filename)
      CALL CREATEFILE(filename,d_i2,size_i2)
      CALL eomccsdtq_y4_6_4_1(d_t1,k_t1_offset,d_v2,k_v2_offset,d_i2,k_i
     &2_offset)
      CALL RECONCILEFILE(d_i2,size_i2)
      CALL eomccsdtq_y4_6_4(d_t1,k_t1_offset,d_i2,k_i2_offset,d_i1,k_i1_
     &offset)
      CALL DELETEFILE(d_i2)
      IF (.not.MA_POP_STACK(l_i2_offset)) CALL ERRQUIT('eomccsdtq_y4',-1
     &,MA_ERR)
      CALL RECONCILEFILE(d_i1,size_i1)
      CALL eomccsdtq_y4_6(d_y4,k_y4_offset,d_i1,k_i1_offset,d_i0,k_i0_of
     &fset)
      CALL DELETEFILE(d_i1)
      IF (.not.MA_POP_STACK(l_i1_offset)) CALL ERRQUIT('eomccsdtq_y4',-1
     &,MA_ERR)
      CALL OFFSET_eomccsdtq_y4_7_1(l_i1_offset,k_i1_offset,size_i1)
      CALL TCE_FILENAME('eomccsdtq_y4_7_1_i1',filename)
      CALL CREATEFILE(filename,d_i1,size_i1)
      CALL eomccsdtq_y4_7_1(d_v2,k_v2_offset,d_i1,k_i1_offset)
      CALL OFFSET_eomccsdtq_y4_7_2_1(l_i2_offset,k_i2_offset,size_i2)
      CALL TCE_FILENAME('eomccsdtq_y4_7_2_1_i2',filename)
      CALL CREATEFILE(filename,d_i2,size_i2)
      CALL eomccsdtq_y4_7_2_1(d_v2,k_v2_offset,d_i2,k_i2_offset)
      CALL eomccsdtq_y4_7_2_2(d_t1,k_t1_offset,d_v2,k_v2_offset,d_i2,k_i
     &2_offset)
      CALL RECONCILEFILE(d_i2,size_i2)
      CALL eomccsdtq_y4_7_2(d_t1,k_t1_offset,d_i2,k_i2_offset,d_i1,k_i1_
     &offset)
      CALL DELETEFILE(d_i2)
      IF (.not.MA_POP_STACK(l_i2_offset)) CALL ERRQUIT('eomccsdtq_y4',-1
     &,MA_ERR)
      CALL eomccsdtq_y4_7_3(d_t2,k_t2_offset,d_v2,k_v2_offset,d_i1,k_i1_
     &offset)
      CALL RECONCILEFILE(d_i1,size_i1)
      CALL eomccsdtq_y4_7(d_y4,k_y4_offset,d_i1,k_i1_offset,d_i0,k_i0_of
     &fset)
      CALL DELETEFILE(d_i1)
      IF (.not.MA_POP_STACK(l_i1_offset)) CALL ERRQUIT('eomccsdtq_y4',-1
     &,MA_ERR)
      CALL OFFSET_eomccsdtq_y4_8_1(l_i1_offset,k_i1_offset,size_i1)
      CALL TCE_FILENAME('eomccsdtq_y4_8_1_i1',filename)
      CALL CREATEFILE(filename,d_i1,size_i1)
      CALL eomccsdtq_y4_8_1(d_v2,k_v2_offset,d_i1,k_i1_offset)
      CALL eomccsdtq_y4_8_2(d_t1,k_t1_offset,d_v2,k_v2_offset,d_i1,k_i1_
     &offset)
      CALL eomccsdtq_y4_8_3(d_t2,k_t2_offset,d_v2,k_v2_offset,d_i1,k_i1_
     &offset)
      CALL OFFSET_eomccsdtq_y4_8_4_1(l_i2_offset,k_i2_offset,size_i2)
      CALL TCE_FILENAME('eomccsdtq_y4_8_4_1_i2',filename)
      CALL CREATEFILE(filename,d_i2,size_i2)
      CALL eomccsdtq_y4_8_4_1(d_t1,k_t1_offset,d_v2,k_v2_offset,d_i2,k_i
     &2_offset)
      CALL RECONCILEFILE(d_i2,size_i2)
      CALL eomccsdtq_y4_8_4(d_t1,k_t1_offset,d_i2,k_i2_offset,d_i1,k_i1_
     &offset)
      CALL DELETEFILE(d_i2)
      IF (.not.MA_POP_STACK(l_i2_offset)) CALL ERRQUIT('eomccsdtq_y4',-1
     &,MA_ERR)
      CALL RECONCILEFILE(d_i1,size_i1)
      CALL eomccsdtq_y4_8(d_y4,k_y4_offset,d_i1,k_i1_offset,d_i0,k_i0_of
     &fset)
      CALL DELETEFILE(d_i1)
      IF (.not.MA_POP_STACK(l_i1_offset)) CALL ERRQUIT('eomccsdtq_y4',-1
     &,MA_ERR)
      CALL eomccsdtq_y4_9(d_y4,k_y4_offset,d_v2,k_v2_offset,d_i0,k_i0_of
     &fset)
      CALL OFFSET_eomccsdtq_y4_10_1(l_i1_offset,k_i1_offset,size_i1)
      CALL TCE_FILENAME('eomccsdtq_y4_10_1_i1',filename)
      CALL CREATEFILE(filename,d_i1,size_i1)
      CALL eomccsdtq_y4_10_1(d_t1,k_t1_offset,d_y3,k_y3_offset,d_i1,k_i1
     &_offset)
      CALL eomccsdtq_y4_10_2(d_t2,k_t2_offset,d_y4,k_y4_offset,d_i1,k_i1
     &_offset)
      CALL RECONCILEFILE(d_i1,size_i1)
      CALL eomccsdtq_y4_10(d_i1,k_i1_offset,d_v2,k_v2_offset,d_i0,k_i0_o
     &ffset)
      CALL DELETEFILE(d_i1)
      IF (.not.MA_POP_STACK(l_i1_offset)) CALL ERRQUIT('eomccsdtq_y4',-1
     &,MA_ERR)
      CALL OFFSET_eomccsdtq_y4_11_1(l_i1_offset,k_i1_offset,size_i1)
      CALL TCE_FILENAME('eomccsdtq_y4_11_1_i1',filename)
      CALL CREATEFILE(filename,d_i1,size_i1)
      CALL eomccsdtq_y4_11_1(d_t1,k_t1_offset,d_y4,k_y4_offset,d_i1,k_i1
     &_offset)
      CALL RECONCILEFILE(d_i1,size_i1)
      CALL eomccsdtq_y4_11(d_i1,k_i1_offset,d_f1,k_f1_offset,d_i0,k_i0_o
     &ffset)
      CALL DELETEFILE(d_i1)
      IF (.not.MA_POP_STACK(l_i1_offset)) CALL ERRQUIT('eomccsdtq_y4',-1
     &,MA_ERR)
      CALL OFFSET_eomccsdtq_y4_12_1(l_i1_offset,k_i1_offset,size_i1)
      CALL TCE_FILENAME('eomccsdtq_y4_12_1_i1',filename)
      CALL CREATEFILE(filename,d_i1,size_i1)
      CALL eomccsdtq_y4_12_1(d_t1,k_t1_offset,d_y4,k_y4_offset,d_i1,k_i1
     &_offset)
      CALL RECONCILEFILE(d_i1,size_i1)
      CALL eomccsdtq_y4_12(d_i1,k_i1_offset,d_v2,k_v2_offset,d_i0,k_i0_o
     &ffset)
      CALL DELETEFILE(d_i1)
      IF (.not.MA_POP_STACK(l_i1_offset)) CALL ERRQUIT('eomccsdtq_y4',-1
     &,MA_ERR)
      CALL OFFSET_eomccsdtq_y4_13_1(l_i1_offset,k_i1_offset,size_i1)
      CALL TCE_FILENAME('eomccsdtq_y4_13_1_i1',filename)
      CALL CREATEFILE(filename,d_i1,size_i1)
      CALL eomccsdtq_y4_13_1(d_t1,k_t1_offset,d_y4,k_y4_offset,d_i1,k_i1
     &_offset)
      CALL RECONCILEFILE(d_i1,size_i1)
      CALL eomccsdtq_y4_13(d_i1,k_i1_offset,d_v2,k_v2_offset,d_i0,k_i0_o
     &ffset)
      CALL DELETEFILE(d_i1)
      IF (.not.MA_POP_STACK(l_i1_offset)) CALL ERRQUIT('eomccsdtq_y4',-1
     &,MA_ERR)
      CALL OFFSET_eomccsdtq_y4_14_1(l_i1_offset,k_i1_offset,size_i1)
      CALL TCE_FILENAME('eomccsdtq_y4_14_1_i1',filename)
      CALL CREATEFILE(filename,d_i1,size_i1)
      CALL eomccsdtq_y4_14_1(d_t2,k_t2_offset,d_y4,k_y4_offset,d_i1,k_i1
     &_offset)
      CALL RECONCILEFILE(d_i1,size_i1)
      CALL eomccsdtq_y4_14(d_i1,k_i1_offset,d_v2,k_v2_offset,d_i0,k_i0_o
     &ffset)
      CALL DELETEFILE(d_i1)
      IF (.not.MA_POP_STACK(l_i1_offset)) CALL ERRQUIT('eomccsdtq_y4',-1
     &,MA_ERR)
      CALL OFFSET_eomccsdtq_y4_15_1(l_i1_offset,k_i1_offset,size_i1)
      CALL TCE_FILENAME('eomccsdtq_y4_15_1_i1',filename)
      CALL CREATEFILE(filename,d_i1,size_i1)
      CALL eomccsdtq_y4_15_1(d_t2,k_t2_offset,d_y4,k_y4_offset,d_i1,k_i1
     &_offset)
      CALL OFFSET_eomccsdtq_y4_15_2_1(l_i2_offset,k_i2_offset,size_i2)
      CALL TCE_FILENAME('eomccsdtq_y4_15_2_1_i2',filename)
      CALL CREATEFILE(filename,d_i2,size_i2)
      CALL eomccsdtq_y4_15_2_1(d_t1,k_t1_offset,d_y4,k_y4_offset,d_i2,k_
     &i2_offset)
      CALL RECONCILEFILE(d_i2,size_i2)
      CALL eomccsdtq_y4_15_2(d_t1,k_t1_offset,d_i2,k_i2_offset,d_i1,k_i1
     &_offset)
      CALL DELETEFILE(d_i2)
      IF (.not.MA_POP_STACK(l_i2_offset)) CALL ERRQUIT('eomccsdtq_y4',-1
     &,MA_ERR)
      CALL RECONCILEFILE(d_i1,size_i1)
      CALL eomccsdtq_y4_15(d_i1,k_i1_offset,d_v2,k_v2_offset,d_i0,k_i0_o
     &ffset)
      CALL DELETEFILE(d_i1)
      IF (.not.MA_POP_STACK(l_i1_offset)) CALL ERRQUIT('eomccsdtq_y4',-1
     &,MA_ERR)
      RETURN
      END
c#endif
