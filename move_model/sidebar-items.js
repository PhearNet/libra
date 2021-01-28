initSidebarItems({"fn":[["run_bytecode_model_builder","Build a `GlobalEnv` from a collection of `CompiledModule`'s. The `modules` list must be topologically sorted by the dependency relation (i.e., a child node in the dependency graph should appear earlier in the vector than its parents)."],["run_model_builder",""]],"macro":[["emit","Macro to emit a simple or formatted string."],["emitln","Macro to emit a simple or formatted string followed by a new line."]],"mod":[["ast","Contains AST definitions for the specification language fragments of the Move language. Note that in this crate, specs are represented in AST form, whereas code is represented as bytecodes. Therefore we do not need an AST for the Move code itself."],["code_writer","A helper for generating structured code."],["exp_rewriter",""],["model","Provides a model for a set of Move modules (and scripts, which are handled like modules). The model allows to access many different aspects of the Move code: all declared functions and types, their associated bytecode, there source location, there source text, and the specification fragments."],["pragmas","Provides pragmas and properties of the specification language."],["symbol","Contains definitions of symbols -- internalized strings which support fast hashing and comparison."],["ty","Contains types and related functions."]]});