module cme257mod

# export functions that you want to use outside the module
export ModType, speak

type ModType
  x::Int64
end

function speak()
  println("hello from cme257mod!")
end


end #module
