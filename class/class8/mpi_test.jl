using MPI
# modified from https://github.com/JuliaParallel/MPI.jl/blob/master/examples/01-hello-impl.jl

function main()
	 MPI.Init()

	 comm = MPI.COMM_WORLD
	 println("Hello world, I am $(MPI.Comm_rank(comm)) of $(MPI.Comm_size(comm))")
	 MPI.Barrier(comm)

	 MPI.Finalize()
end

main()