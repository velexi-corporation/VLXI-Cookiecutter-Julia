#   Copyright (c) YYYY Velexi Corporation
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.

"""
XYZType.jl defines the XYZType type and type-specific methods.
"""

# --- Exports

# Types
export XYZType

# Properties
export id

# Functions/Methods
export say_hello

# --- Types

struct XYZType
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
    id(x::XYZType)

Return id.
"""
id(x::XYZType) = x.id

"""
    say_hello(who::XYZType)

Return "Hello, `who`".
"""
say_hello(who::XYZType) = "Hello, $(who.name)"
