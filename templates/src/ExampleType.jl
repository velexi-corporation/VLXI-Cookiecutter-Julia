"""
ExampleType.jl defines the ExampleType type and type-specific methods.

--------------------------------------------------------------------------------------------
COPYRIGHT/LICENSE. This file is part of the {{ PKG_NAME }} package. It is subject to the
license terms in the LICENSE file found in the root directory of this distribution. No
part of the {{ PKG_NAME }} package, including this file, may be copied, modified,
propagated, or distributed except according to the terms contained in the LICENSE file.
--------------------------------------------------------------------------------------------
"""
# --- Exports

# Types
export ExampleType

# Properties
export id

# Functions/Methods
export say_hello

# --- Types

struct ExampleType
    #=
      Fields
      ------
      * `id`: ID
      * `name`: name
    =#
    id::Int
    name::String
end

# --- Methods

"""
    id(x::ExampleType)

Return id.
"""
id(x::ExampleType) = x.id

"""
    say_hello(who::ExampleType)

Return "Hello, `who`".
"""
say_hello(who::ExampleType) = "Hello, $(who.name)"
