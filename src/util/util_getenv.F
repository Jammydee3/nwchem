      subroutine util_getenv(env_name, env_value)
* $Id$
      implicit none
#include "errquit.fh"
#include "stdio.fh"      
      character*(*) env_name  ! [input] the name of the environment variable to check for
      character*(*) env_value ! [output] the value of the named environement variable
#if defined(CRAY)
      integer*4 lname, lvalue, lerror
#endif
*
#if defined(CRAY)
      lname  = 0
      lvalue = 0
      lerror = 0
      call pxfgetenv(env_name,lname,env_value,lvalue,lerror)
      if (lerror.eq.0) then  ! 0 ok found env_name
        return
      else if (lerror.eq.22) then  ! 22 env_name is not in environment
        env_value = ' '
        return
      else
        call errquit('util_getenv:pxfgetenv fatal error',
     *        lerror, UNKNOWN_ERR)
      endif
#else
      call getenv(env_name, env_value)
#endif
*
      end
      integer function util_micdev()
#if defined(USE_OPENMP) && defined(USE_OFFLOAD)
      use mic_lib
      implicit none
#include "global.fh"
#include "errquit.fh"
      external offload_master
      logical offload_master
c                                                                               
      integer numdevs
      integer*4 util_mic_get_device
      external util_mic_get_device
c                                                                               
      if(.not.offload_master()) call errquit(
     A     ' need to be offload master',0,0)
      util_micdev=util_mic_get_device()
#else
      util_micdev=-1
      call errquit(' micdev: wrong installation',0,0)
#endif
      return
      end
#if !defined(USE_OFFLOAD)
      logical function offload_master()
      implicit none
c     dummy function when offload is not in place
      offload_master=.false.
      return
      end
#endif
