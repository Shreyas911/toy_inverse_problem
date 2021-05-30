program driver_AT
	
	use forward_diff, n => nx, fp => forward_problem_hessian_action !! Alias to a local variable

	implicit none 

	real(8) :: M0, M1, M0b = 0., M1b = 0.
	real(8), dimension(n+1) :: h_capital_final = 0., h_capital_finalb = 0.
	integer :: ii

	! opening the state file for reading
        open (99, file = 'state.txt', status = 'old')
	read(99,*) M0
	read(99,*) M1
	close(99)
        !! Tangent Linear Model


        open (100, file = 'direction_AT_action.txt', status = 'old')
        do ii = 1, n+1
		read(100, *) h_capital_finalb(ii) 
	end do
	close(100)
        !! TLM
        call forward_problem_hessian_action_b(M0,M0b,M1,M1b,h_capital_final,h_capital_finalb)


	open (unit = 1, file = "AT_action.txt", action="write",status="replace")      
        
	write(1,*) M0b
	write(1,*) M1b

	close(1)

end program driver_AT

