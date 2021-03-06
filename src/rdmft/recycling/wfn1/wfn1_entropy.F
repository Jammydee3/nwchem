C> \ingroup wfn1
C> @{
C>
C> \brief Calculate the entropy for every orbital in a spin-channel
C>
C> This routine calculates the entropy for every orbital in a spin-
C> channel. The entropy of a natural orbital is a function of the
C> occupation of that orbital. That is the occupation number of the
C> total spin density matrix in that spin-channel.
C>
C> The entropy of an extended orbital is composed from the natural
C> orbital entropies according to the fraction of the extended orbital
C> that occupies that natural orbital. However, we need to assign the
C> entropy based on the fraction of the occupation that an extended
C> orbital contributes.
C>
      subroutine wfn1_entropy(g_inf,nbf,ne,r_of,r_s,docc,entropy)
      implicit none
c
      logical g_inf !< [Input] .True. if Stirling approximation is to be
                    !< used (infinity degeneracy), otherwise the 
                    !< orbital degeneracy is assumed to be 1.
      integer nbf !< [Input] The number of basis functions
      integer ne  !< [Input] The number of electron in this spin channel
c
      double precision r_of(nbf,nbf) !< [Input] The occupation functions
                                     !< for this spin channel
c
      double precision r_s(nbf)      !< [Output] The entropy of every
                                     !< extended orbital
c
      double precision docc(nbf) !< [Scratch] The total occupation
                                 !< numbers
      double precision entropy(nbf) !< [Scratch] The entropy for natural
                                    !< orbitals
c
      double precision tocc !< Occupation contributed by an extended
                            !< orbital
      integer ii !< Counter over natural orbitals
      integer ir !< Counter over occupation functions
c
      double precision gs !< The orbital degeneracy
      double precision dcc !< Occupation number at maximum entropy
      double precision scale !< Scale factor to scale the finite 
      !< degeneracy entropy maximum up to the infinite deneracy entropy
      !< maximum
c
c     Code
c
      gs = 1.0d0
      dcc = 0.5d0
      scale = -(dlgama(gs+1.0d0)-dlgama(gs*dcc+1.0d0)
     +         -dlgama(gs*(1.0d0-dcc)+1.0d0))/gs
      scale = ((dcc)*dlog(dcc) + (1.0d0-dcc)*dlog(1.0d0-dcc))/scale
c
      do ii = 1, nbf
        docc(ii) = 0.0d0
        r_s(ii) = 0.0d0
      enddo
      do ir = 1, ne
        do ii = 1, nbf
          docc(ii) = docc(ii) + r_of(ii,ir)**2
        enddo
      enddo
      do ii = 1, nbf
        if (docc(ii).lt.1.0d-14) then
          entropy(ii) = 0.0d0
        else if (docc(ii).gt.(1.0d0-1.0d-14)) then
          entropy(ii) = 0.0d0
        else
          if (g_inf) then
            entropy(ii) = (docc(ii))*dlog(docc(ii))
     &                  + (1.0d0-docc(ii))*dlog(1.0d0-docc(ii))
          else
            entropy(ii) = -(dlgama(gs+1.0d0)-dlgama(gs*docc(ii)+1.0d0)
     +                      -dlgama(gs*(1.0d0-docc(ii))+1.0d0))/gs
            entropy(ii) = scale*entropy(ii)
          endif
        endif
      enddo
c
c     do ii = 1, nbf
c       entropy(ii) = entropy(ii)*(exp(1.0d0)/2.0d0)
c     enddo
c
      do ir = 1, ne
        do ii = 1, nbf
          tocc = r_of(ii,ir)**2
          if (tocc.gt.1.0d-30) then
            r_s(ir) = r_s(ir) + (tocc/docc(ii))*entropy(ii)
          endif
c         r_s(ii) = entropy(ii)
        enddo
      enddo
      end
C>
C> @}
