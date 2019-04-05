program Spigot
   integer, parameter :: n = 1000, len = (10*n)/3;
   integer ::nines=0, predigit=0, q=0, x=0
   integer, dimension(1:len) :: a
   character(len=100)::filename

   write(*,*)"please give a filename"
   read(*,*)filename
   OPEN (7, FILE = filename)
   do i=1,len
    a(i) = 2
   end do

   do j=1,n
     q = 0
     do i=len,1,-1
       x = 10*a(i) + q*i 
       a(i) = modulo(x, (2*i-1))
       q = x / (2*i-1)
     enddo
     a(1) = modulo(q, 10)
     q = q/10
     if (q == 9) then 
        nines = nines +1;
      else if (q == 10) then
        write(7,"(I1)",advance="no") predigit + 1
        do k=1,nines
          write(7,"(I1)",advance="no") 0     
        enddo   
        predigit = 0;
        nines = 0;
      else
        write(7,"(I1)",advance="no") predigit
        predigit = q
        if (nines /= 0) then
          do k=1,nines
            write(7,"(I1)",advance="no") 9
          enddo
        endif
        nines = 0
       
     endif
   enddo
   write(7,"(I1)") predigit

    !write(7,*)a
end program Spigot