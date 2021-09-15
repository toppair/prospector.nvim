((shorthand_property_identifier_pattern) @Constant
 (#match? @Constant "^[A-Z_]+$"))

(call_expression (identifier) @Include (#match? @Include "require"))

