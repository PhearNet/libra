# Dependency Diagram Generator

This crate generates the dependency diagrams of the stdlib modules (`../../diem-framework/modules`). The diagrams are generated as `.dot` files in the `diagrams` sub-directory, which include:
* the forward dependency diagram for each module ({ModuleName}.forward.dot)
* the backward dependency diagram for each module ({ModuleName}.backward.dot)
* the diagram for the entire dependency graph ("(EntireGraph.dot)")

The command to run is:
```
cargo run -p diagen
```
Note that this command can be run anywhere in the `diem` repo because it will automatically locate `language/diem-framework/modules` (i.e., input directory) and `language/move-prover/diagen/diagrams` (i.e., output directory).

To convert `.dot` into `.pdf`, run the following command:
```
brew install graphviz
cd diagrams
chmod +x convert_all_dot_to_pdf.sh
./convert_all_dot_to_pdf.sh
```
