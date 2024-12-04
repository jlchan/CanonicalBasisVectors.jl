module CanonicalBasisVectors

export CanonicalBasisVector, inner

# define CanonicalBasisVector type as a new AbstractVector type
struct CanonicalBasisVector <: AbstractVector{Bool}
    length::Int64
    index::Int64
end

# using "import" to extend Julia's built-in functions
import Base: size, getindex
Base.size(x::CanonicalBasisVector) = (x.length, )
Base.getindex(x::CanonicalBasisVector, i) = (i == x.index)

inner(x, A, y) = dot(x, A, y)
inner(x::CanonicalBasisVector, A, y) = dot(A[x.index,:], y)
inner(x, A, y::CanonicalBasisVector) = dot(x, A[:, y.index])
inner(x::CanonicalBasisVector, A, 
      y::CanonicalBasisVector) = A[x.index, y.index]

end # module CanonicalBasisVectors
