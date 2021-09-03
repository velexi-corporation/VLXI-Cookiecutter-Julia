"""
ExampleType.jl defines the ExampleType type and core methods

------------------------------------------------------------------------------
COPYRIGHT/LICENSE. This file is part of the {{ PKG_NAME }} package. It is
subject to the license terms in the LICENSE file found in the root directory
of this distribution. No part of the {{ PKG_NAME }} package, including this
file, may be copied, modified, propagated, or distributed except according to
the terms contained in the LICENSE file.
------------------------------------------------------------------------------
"""
# --- Exports

# Types
export ExampleType

# Functions
export get_id

# --- Type definitions

struct ExampleType
    #=
      Fields
      ------
      * `id`: node ID
    =#
    id::Int
end

# --- Methods


"""
    get_id(x::ExampleType)

Return id.
"""
get_id(x::ExampleType) = x.id
